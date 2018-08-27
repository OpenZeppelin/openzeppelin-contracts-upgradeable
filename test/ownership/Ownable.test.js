import shouldBehaveLikeOwnable from './Ownable.behaviour';

const Ownable = artifacts.require('Ownable');

contract('Ownable', function (accounts) {
  beforeEach(async function () {
    this.ownable = await Ownable.new();
    await this.ownable.initialize(accounts[0]);
  });

  it('should have an owner', async function () {
    let owner = await this.ownable.owner();
    assert.isTrue(owner !== 0);
  });

  it('changes owner after transfer', async function () {
    let other = accounts[1];
    await this.ownable.transferOwnership(other);
    let owner = await this.ownable.owner();

    assert.isTrue(owner === other);
  });

  shouldBehaveLikeOwnable(accounts);
});
