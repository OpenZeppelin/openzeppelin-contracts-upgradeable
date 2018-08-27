import shouldBehaveLikeMintableToken from './MintableToken.behaviour';
const MintableToken = artifacts.require('MintableToken');

contract('MintableToken', function ([owner, anotherAccount]) {
  const minter = owner;

  beforeEach(async function () {
    this.token = await MintableToken.new();
    await this.token.initialize(owner);
  });

  shouldBehaveLikeMintableToken([owner, anotherAccount, minter]);
});
