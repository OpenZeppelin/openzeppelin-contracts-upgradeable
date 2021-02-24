// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../token/ERC721/extensions/ERC721BurnableUpgradeable.sol";
import "../utils/Initializable.sol";

contract ERC721BurnableMockUpgradeable is Initializable, ERC721BurnableUpgradeable {
    function __ERC721BurnableMock_init(string memory name, string memory symbol) internal initializer {
        __Context_init_unchained();
        __ERC165_init_unchained();
        __ERC721_init_unchained(name, symbol);
        __ERC721Burnable_init_unchained();
        __ERC721BurnableMock_init_unchained(name, symbol);
    }

    function __ERC721BurnableMock_init_unchained(string memory name, string memory symbol) internal initializer { }

    function mint(address to, uint256 tokenId) public {
        _mint(to, tokenId);
    }
    uint256[50] private __gap;
}
