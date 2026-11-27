import { network } from 'hardhat';
import { expect } from 'chai';
import { getDomain } from './helpers/eip712';
import { ImplementationLabel } from './helpers/storage';

const connection = await network.create();
const {
  ethers,
  helpers: { storage },
  networkHelpers: { loadFixture },
} = connection;

const name = 'My Token';
const symbol = 'MTKN';
const version = '1';
const initialSupply = 100n;
const value = 10n;

async function fixture() {
  const [admin, holder, recipient, delegatee] = await ethers.getSigners();

  const implV1 = await ethers.deployContract('$ERC20WithoutVotes', ['name', 'symbol']);
  const implV2 = await ethers.deployContract('$ERC20WithVotes', ['name', 'symbol', 'name', 'version']);

  const token = await ethers
    .deployContract('ERC1967Proxy', [implV1, implV1.interface.encodeFunctionData('initialize', [name, symbol])])
    .then(({ target }) => implV1.attach(target));
  await token.$_mint(holder, initialSupply);

  return { admin, holder, recipient, delegatee, implV1, implV2, token };
}

describe('ERC20 proxy upgraded to ERC20Votes', function () {
  beforeEach(async function () {
    Object.assign(this, connection, await loadFixture(fixture));
  });

  describe('before upgrade', function () {
    it('is initialized', async function () {
      await expect(storage.getAddressInSlot(this.token, ImplementationLabel)).to.eventually.equal(this.implV1);
      await expect(this.token.name()).to.eventually.equal(name);
      await expect(this.token.symbol()).to.eventually.equal(symbol);
      await expect(this.token.decimals()).to.eventually.equal(18n);
    });

    it('holds the minted tokens', async function () {
      await expect(this.token.totalSupply()).to.eventually.equal(initialSupply);
      await expect(this.token.balanceOf(this.holder)).to.eventually.equal(initialSupply);
    });

    it('does not expose voting yet', async function () {
      expect(this.token.interface.hasFunction('delegate')).to.be.false;
    });
  });

  describe('after upgrade', function () {
    beforeEach(async function () {
      this.tx = await this.token.upgradeToAndCall(
        this.implV2,
        this.implV2.interface.encodeFunctionData('initializeV2', [name, version]),
      );
      this.token = this.implV2.attach(this.token.target);
    });

    it('points to the new implementation', async function () {
      await expect(this.tx).to.emit(this.token, 'Upgraded').withArgs(this.implV2);
      await expect(storage.getAddressInSlot(this.token, ImplementationLabel)).to.eventually.equal(this.implV2);
    });

    it('preserves the ERC20 state', async function () {
      await expect(this.token.name()).to.eventually.equal(name);
      await expect(this.token.symbol()).to.eventually.equal(symbol);
      await expect(this.token.decimals()).to.eventually.equal(18n);
      await expect(this.token.totalSupply()).to.eventually.equal(initialSupply);
      await expect(this.token.balanceOf(this.holder)).to.eventually.equal(initialSupply);
    });

    it('sets up the EIP-712 domain, and cannot be re-initialized', async function () {
      await expect(getDomain(this.token)).to.eventually.include({ name, version });

      await expect(this.token.initialize(name, symbol)).to.be.revertedWithCustomError(
        this.token,
        'InvalidInitialization',
      );
      await expect(this.token.initializeV2(name, version)).to.be.revertedWithCustomError(
        this.token,
        'InvalidInitialization',
      );
    });

    it('starts with no voting power for the pre-upgrade balance', async function () {
      await expect(this.token.delegates(this.holder)).to.eventually.equal(ethers.ZeroAddress);
      await expect(this.token.getVotes(this.holder)).to.eventually.equal(0n);
      await expect(this.token.$_getTotalSupply()).to.eventually.equal(0n);
    });

    describe('delegate', function () {
      it('activates the voting power of the pre-upgrade balance', async function () {
        await expect(this.token.connect(this.holder).delegate(this.holder))
          .to.emit(this.token, 'DelegateChanged')
          .withArgs(this.holder, ethers.ZeroAddress, this.holder)
          .to.emit(this.token, 'DelegateVotesChanged')
          .withArgs(this.holder, 0n, initialSupply);

        await expect(this.token.delegates(this.holder)).to.eventually.equal(this.holder);
        await expect(this.token.getVotes(this.holder)).to.eventually.equal(initialSupply);
        await expect(this.token.$_getTotalSupply()).to.eventually.equal(0n);
      });
    });

    describe('transfer', function () {
      beforeEach(async function () {
        await this.token.connect(this.holder).delegate(this.holder);
        await this.token.connect(this.recipient).delegate(this.delegatee);
      });

      it('moves both the balance and the voting power', async function () {
        await expect(this.token.connect(this.holder).transfer(this.recipient, value))
          .to.emit(this.token, 'Transfer')
          .withArgs(this.holder, this.recipient, value)
          .to.emit(this.token, 'DelegateVotesChanged')
          .withArgs(this.holder, initialSupply, initialSupply - value)
          .to.emit(this.token, 'DelegateVotesChanged')
          .withArgs(this.delegatee, 0n, value);

        await expect(this.token.balanceOf(this.holder)).to.eventually.equal(initialSupply - value);
        await expect(this.token.balanceOf(this.recipient)).to.eventually.equal(value);
        await expect(this.token.getVotes(this.holder)).to.eventually.equal(initialSupply - value);
        await expect(this.token.getVotes(this.delegatee)).to.eventually.equal(value);
        await expect(this.token.$_getTotalSupply()).to.eventually.equal(0n);
      });
    });

    describe('mint', function () {
      beforeEach(async function () {
        await this.token.connect(this.holder).delegate(this.holder);
      });

      it('increases both the total supply and the voting power', async function () {
        await expect(this.token.$_mint(this.holder, value))
          .to.emit(this.token, 'Transfer')
          .withArgs(ethers.ZeroAddress, this.holder, value)
          .to.emit(this.token, 'DelegateVotesChanged')
          .withArgs(this.holder, initialSupply, initialSupply + value);

        await expect(this.token.totalSupply()).to.eventually.equal(initialSupply + value);
        await expect(this.token.balanceOf(this.holder)).to.eventually.equal(initialSupply + value);
        await expect(this.token.getVotes(this.holder)).to.eventually.equal(initialSupply + value);
        await expect(this.token.$_getTotalSupply()).to.eventually.equal(value);
      });
    });

    describe('burn', function () {
      // Note: error happens without a delegation
      it('revert because of overflow', async function () {
        await expect(this.token.$_burn(this.holder, value)).to.revertedWithPanic('0x11'); // arithmetic underflow
      });
    });
  });
});
