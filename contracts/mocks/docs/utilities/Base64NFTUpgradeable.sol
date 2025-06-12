// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {ERC721Upgradeable} from "../../../token/ERC721/ERC721Upgradeable.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";
import {Initializable} from "../../../proxy/utils/Initializable.sol";

contract Base64NFTUpgradeable is Initializable, ERC721Upgradeable {
    using Strings for uint256;

    function __Base64NFT_init() internal onlyInitializing {
        __ERC721_init_unchained("Base64NFT", "MTK");
    }

    function __Base64NFT_init_unchained() internal onlyInitializing {}

    // ...

    function tokenURI(uint256 tokenId) public pure override returns (string memory) {
        // Equivalent to:
        // {
        //   "name": "Base64NFT #1",
        //   // Replace with extra ERC-721 Metadata properties
        // }
        // prettier-ignore
        string memory dataURI = string.concat("{\"name\": \"Base64NFT #", tokenId.toString(), "\"}");

        return string.concat("data:application/json;base64,", Base64.encode(bytes(dataURI)));
    }
}
