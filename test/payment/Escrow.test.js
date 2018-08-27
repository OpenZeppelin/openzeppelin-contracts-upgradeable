import shouldBehaveLikeEscrow from './Escrow.behaviour';

const Escrow = artifacts.require('Escrow');

contract('Escrow', function (accounts) {
  const owner = accounts[0];

  beforeEach(async function () {
    this.escrow = await Escrow.new({ from: owner });
    await this.escrow.initialize(owner, { from: owner });
  });

  shouldBehaveLikeEscrow(owner, accounts.slice(1));
});
