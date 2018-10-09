pragma solidity ^0.4.24;

import "../Initializable.sol";
import "../token/ERC20/ERC20Detailed.sol";
import "../token/ERC20/ERC20Mintable.sol";
import "../token/ERC20/ERC20Pausable.sol";


/**
 * @title Standard ERC20 token, with minting and pause functionality.
 *
 */
contract StandardToken is Initializable, ERC20Detailed, ERC20Mintable, ERC20Pausable {
  function initialize(string name, string symbol, uint8 decimals, uint256 initialSupply, address initialHolder, address[] minters, address[] pausers) public initializer {
    ERC20Detailed.initialize(name, symbol, decimals);

    // Mint the initial supply
    if (initialSupply > 0) { // To allow passing a null address when not doing any initial supply
      _mint(initialHolder, initialSupply);
    }

    // Make this contract the initial minter and pauser, and then transfer permissions
    // to the requested accounts

    ERC20Mintable.initialize(address(this));
    for (uint256 i = 0; i < minters.length; ++i) {
      addMinter(minters[i]);
    }
    renounceMinter();

    ERC20Pausable.initialize(address(this));
    for (i = 0; i < pausers.length; ++i) {
      addPauser(pausers[i]);
    }
    renouncePauser();
  }
}
