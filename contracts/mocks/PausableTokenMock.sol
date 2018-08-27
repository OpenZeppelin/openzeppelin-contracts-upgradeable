pragma solidity ^0.4.24;

import "../token/ERC20/PausableToken.sol";


// mock class using PausableToken
contract PausableTokenMock is PausableToken {

  constructor(address initialAccount, uint initialBalance) public {
    Ownable.initialize(msg.sender);

    balances[initialAccount] = initialBalance;
  }

}
