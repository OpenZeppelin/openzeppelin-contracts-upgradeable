pragma solidity ^0.4.24;

import "./ERC20.sol";
import "zos-lib/contracts/migrations/Migratable.sol";


/**
 * @title DetailedERC20 token
 * @dev The decimals are only for visualization purposes.
 * All the operations are done using the smallest and indivisible token unit,
 * just as on Ethereum all the operations are done in wei.
 */
contract DetailedERC20 is Migratable, ERC20 {
  string public name;
  string public symbol;
  uint8 public decimals;

  function initialize(string _name, string _symbol, uint8 _decimals) public isInitializer("DetailedERC20", "1.9.0") {
    name = _name;
    symbol = _symbol;
    decimals = _decimals;
  }
}
