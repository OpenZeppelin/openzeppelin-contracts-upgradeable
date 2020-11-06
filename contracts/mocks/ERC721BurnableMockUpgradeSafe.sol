// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../token/ERC721/ERC721BurnableUpgradeSafe.sol";
import "../Initializable.sol";

contract ERC721BurnableMockUpgradeSafe is __Initializable, ERC721BurnableUpgradeSafe {
    function __ERC721BurnableMock_init(string memory name, string memory symbol) internal __initializer {
        __Context_init_unchained();
        __ERC165_init_unchained();
        __ERC721_init_unchained(name, symbol);
        __ERC721Burnable_init_unchained();
        __ERC721BurnableMock_init_unchained(name, symbol);
    }

    function __ERC721BurnableMock_init_unchained(string memory name, string memory symbol) internal __initializer { }

    function mint(address to, uint256 tokenId) public {
        _mint(to, tokenId);
    }
}
