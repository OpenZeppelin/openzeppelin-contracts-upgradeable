const { accounts, contract } = require('@openzeppelin/test-environment');

require('@openzeppelin/test-helpers');

const ContextMock = contract.fromArtifact('ContextMockUpgradeSafe');
const ContextMockCaller = contract.fromArtifact('ContextMockCallerUpgradeSafe');

const { shouldBehaveLikeRegularContext } = require('./Context.behavior');

describe('Context', function () {
  const [ sender ] = accounts;

  beforeEach(async function () {
    this.context = await ContextMock.new();
    this.caller = await ContextMockCaller.new();
  });

  shouldBehaveLikeRegularContext(sender);
});
