// contracts/MyERC115HolderContract.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC1155HolderUpgradeable} from "../../../../token/ERC1155/utils/ERC1155HolderUpgradeable.sol";
import {Initializable} from "../../../../proxy/utils/Initializable.sol";

contract MyERC115HolderContractUpgradeable is Initializable, ERC1155HolderUpgradeable {    function __MyERC115HolderContract_init() internal onlyInitializing {
    }

    function __MyERC115HolderContract_init_unchained() internal onlyInitializing {
    }
}
