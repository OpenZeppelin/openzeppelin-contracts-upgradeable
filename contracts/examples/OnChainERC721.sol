pragma solidity ^0.4.24;

import "zos-lib/contracts/Initializable.sol";
import "../token/ERC721/ERC721Full.sol";
import "../token/ERC721/ERC721MetadataMintable.sol";
import "../token/ERC721/ERC721Pausable.sol";


/**
 * @title Standard ERC721 token, with minting and pause functionality.
 *
 */
contract OnChainERC721 is Initializable, ERC721Full, ERC721MetadataMintable, ERC721Pausable {
  function initialize(string name, string symbol, address[] minters, address[] pausers) public initializer {
    ERC721.initialize();
    ERC721Enumerable.initialize();
    ERC721Metadata.initialize(name, symbol);

    // Initialize the minter and pauser roles, and renounce them
    ERC721MetadataMintable.initialize(address(this));
    renounceMinter();

    ERC721Pausable.initialize(address(this));
    renouncePauser();

    // Add the requested minters and pausers (this can be done after renouncing since
    // these are the internal calls)
    for (uint256 i = 0; i < minters.length; ++i) {
      _addMinter(minters[i]);
    }

    for (i = 0; i < pausers.length; ++i) {
      _addPauser(pausers[i]);
    }
  }
}
