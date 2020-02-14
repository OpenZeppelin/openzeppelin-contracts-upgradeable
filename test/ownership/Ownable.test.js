
const { accounts, contract } = require('@openzeppelin/test-environment');
const { expectRevert } = require('@openzeppelin/test-helpers');

const { shouldBehaveLikeOwnable } = require('./Ownable.behavior');

const Ownable = contract.fromArtifact('OwnableMock');

describe('Ownable', function () {
  const [ owner, anyone, ...otherAccounts ] = accounts;

  beforeEach(async function () {
    this.ownable = await Ownable.new({ from: owner });
  });

  it('cannot be reinitialized', async function () {
    await expectRevert.unspecified(this.ownable.initialize(anyone));
  });

  shouldBehaveLikeOwnable(owner, otherAccounts);
});
