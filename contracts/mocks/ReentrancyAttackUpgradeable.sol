// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {ContextUpgradeable} from "../utils/ContextUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

contract ReentrancyAttackUpgradeable is Initializable, ContextUpgradeable {
    function __ReentrancyAttack_init() internal onlyInitializing {
    }

    function __ReentrancyAttack_init_unchained() internal onlyInitializing {
    }
    function callSender(bytes calldata data) public {
        (bool success, ) = _msgSender().call(data);
        require(success, "ReentrancyAttack: failed call");
    }

    function staticcallSender(bytes calldata data) public view {
        (bool success, ) = _msgSender().staticcall(data);
        require(success, "ReentrancyAttack: failed call");
    }
}
