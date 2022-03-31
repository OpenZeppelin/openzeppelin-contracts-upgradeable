// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ERC1155MockUpgradeable.sol";
import "../token/ERC1155/extensions/ERC1155URIStorageUpgradeable.sol";
import "../proxy/utils/Initializable.sol";

contract ERC1155URIStorageMockUpgradeable is Initializable, ERC1155MockUpgradeable, ERC1155URIStorageUpgradeable {
    function __ERC1155URIStorageMock_init(string memory _uri) internal onlyInitializing {
        __ERC1155_init_unchained(_uri);
        __ERC1155Mock_init_unchained(_uri);
        __ERC1155URIStorage_init_unchained();
    }

    function __ERC1155URIStorageMock_init_unchained(string memory) internal onlyInitializing {}

    function uri(uint256 tokenId) public view virtual override(ERC1155Upgradeable, ERC1155URIStorageUpgradeable) returns (string memory) {
        return ERC1155URIStorageUpgradeable.uri(tokenId);
    }

    function setURI(uint256 tokenId, string memory _tokenURI) public {
        _setURI(tokenId, _tokenURI);
    }

    function setBaseURI(string memory baseURI) public {
        _setBaseURI(baseURI);
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}
