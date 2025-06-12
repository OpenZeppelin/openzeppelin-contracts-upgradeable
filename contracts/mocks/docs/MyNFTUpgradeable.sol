// contracts/MyNFT.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC721Upgradeable} from "../../token/ERC721/ERC721Upgradeable.sol";
import {Initializable} from "../../proxy/utils/Initializable.sol";

contract MyNFTUpgradeable is Initializable, ERC721Upgradeable {
    function __MyNFT_init() internal onlyInitializing {
        __ERC721_init_unchained("MyNFT", "MNFT");
    }

    function __MyNFT_init_unchained() internal onlyInitializing {}
}
