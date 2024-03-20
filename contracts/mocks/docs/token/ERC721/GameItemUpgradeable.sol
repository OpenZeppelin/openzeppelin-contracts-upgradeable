// contracts/GameItem.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC721URIStorageUpgradeable, ERC721Upgradeable} from "../../../../token/ERC721/extensions/ERC721URIStorageUpgradeable.sol";
import {Initializable} from "../../../../proxy/utils/Initializable.sol";

contract GameItemUpgradeable is Initializable, ERC721URIStorageUpgradeable {
    uint256 private _nextTokenId;

    function __GameItem_init() internal onlyInitializing {
        __ERC721_init_unchained("GameItem", "ITM");
    }

    function __GameItem_init_unchained() internal onlyInitializing {}

    function awardItem(address player, string memory tokenURI) public returns (uint256) {
        uint256 tokenId = _nextTokenId++;
        _mint(player, tokenId);
        _setTokenURI(tokenId, tokenURI);

        return tokenId;
    }
}
