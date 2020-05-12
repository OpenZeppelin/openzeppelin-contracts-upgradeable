const { accounts, contract } = require('@openzeppelin/test-environment');

require('@openzeppelin/test-helpers');

const ContextMock = contract.fromArtifact('ContextMockUpgradeable');
const ContextMockCaller = contract.fromArtifact('ContextMockCallerUpgradeable');

const { shouldBehaveLikeRegularContext } = require('./Context.behavior');

describe('Context', function () {
  const [ sender ] = accounts;

  beforeEach(async function () {
    this.context = await ContextMock.new();
    this.caller = await ContextMockCaller.new();
  });

  shouldBehaveLikeRegularContext(sender);
});
