// contracts/MyERC115HolderContract.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC1155Holder} from "@openzeppelin/contracts/token/ERC1155/utils/ERC1155Holder.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

contract MyERC115HolderContractUpgradeable is Initializable, ERC1155Holder {    function __MyERC115HolderContract_init() internal onlyInitializing {
    }

    function __MyERC115HolderContract_init_unchained() internal onlyInitializing {
    }
}
