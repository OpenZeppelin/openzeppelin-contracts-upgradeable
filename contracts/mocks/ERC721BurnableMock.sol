pragma solidity ^0.6.0;

import "../token/ERC721/ERC721Burnable.sol";
import "../Initializable.sol";

contract ERC721BurnableMockUpgradeable is Initializable, ERC721BurnableUpgradeable {

    constructor(string memory name, string memory symbol) public  {
        __ERC721BurnableMock_init(name, symbol);
    }

    function __ERC721BurnableMock_init(string memory name, string memory symbol) internal initializer {
        __Context_init_unchained();
        __ERC165_init_unchained();
        __ERC721_init_unchained(name, symbol);
        __ERC721Burnable_init_unchained();
        __ERC721BurnableMock_init_unchained(name, symbol);
    }

    function __ERC721BurnableMock_init_unchained(string memory name, string memory symbol) internal initializer {


    }


    function mint(address to, uint256 tokenId) public {
        _mint(to, tokenId);
    }

    uint256[50] private __gap;
}
