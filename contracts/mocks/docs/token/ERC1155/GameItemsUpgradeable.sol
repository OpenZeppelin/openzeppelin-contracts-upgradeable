// contracts/GameItems.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC1155Upgradeable} from "../../../../token/ERC1155/ERC1155Upgradeable.sol";
import {Initializable} from "../../../../proxy/utils/Initializable.sol";

contract GameItemsUpgradeable is Initializable, ERC1155Upgradeable {
    uint256 public constant GOLD = 0;
    uint256 public constant SILVER = 1;
    uint256 public constant THORS_HAMMER = 2;
    uint256 public constant SWORD = 3;
    uint256 public constant SHIELD = 4;

    function __GameItems_init() internal onlyInitializing {
        __ERC1155_init_unchained("https://game.example/api/item/{id}.json");
        __GameItems_init_unchained();
    }

    function __GameItems_init_unchained() internal onlyInitializing {
        _mint(msg.sender, GOLD, 10 ** 18, "");
        _mint(msg.sender, SILVER, 10 ** 27, "");
        _mint(msg.sender, THORS_HAMMER, 1, "");
        _mint(msg.sender, SWORD, 10 ** 9, "");
        _mint(msg.sender, SHIELD, 10 ** 9, "");
    }
}
