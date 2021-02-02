// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

import "../token/ERC721/ERC721PausableUpgradeable.sol";
import "../proxy/Initializable.sol";

/**
 * @title ERC721PausableMock
 * This mock just provides a public mint, burn and exists functions for testing purposes
 */
contract ERC721PausableMockUpgradeable is Initializable, ERC721PausableUpgradeable {
    function __ERC721PausableMock_init(string memory name, string memory symbol) internal initializer {
        __Context_init_unchained();
        __ERC165_init_unchained();
        __ERC721_init_unchained(name, symbol);
        __Pausable_init_unchained();
        __ERC721Pausable_init_unchained();
        __ERC721PausableMock_init_unchained(name, symbol);
    }

    function __ERC721PausableMock_init_unchained(string memory name, string memory symbol) internal initializer { }

    function mint(address to, uint256 tokenId) public {
        super._mint(to, tokenId);
    }

    function burn(uint256 tokenId) public {
        super._burn(tokenId);
    }

    function exists(uint256 tokenId) public view returns (bool) {
        return super._exists(tokenId);
    }

    function pause() external {
        _pause();
    }

    function unpause() external {
        _unpause();
    }
    uint256[50] private __gap;
}
