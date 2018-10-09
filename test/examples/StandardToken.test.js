const BigNumber = web3.BigNumber;

const should = require('chai')
  .use(require('chai-bignumber')(BigNumber))
  .should();

const StandardToken = artifacts.require('StandardToken');

contract.only('StandardToken', function ([_, deployer, initialHolder, minterA, minterB, pauserA, pauserB, anyone]) {
  const name = "StdToken";
  const symbol = "STDT";
  const decimals = 18;

  const initialSupply = 300;

  const minters = [minterA, minterB];
  const pausers = [pauserA, pauserB];

  const ZERO_ADDRESS = '0x0000000000000000000000000000000000000000';

  beforeEach(async function () {
    this.token = await StandardToken.new({ from: deployer });
  });

  context('with initial balance', function () {
    beforeEach(async function () {
      await this.token.initialize(name, symbol, decimals, initialSupply, initialHolder, new Array, new Array, { from: deployer });
    });

    it('', async function () {

    });
  });
});
