// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;
import {Initializable} from "../proxy/utils/Initializable.sol";
import {ContextUpgradeable} from "./ContextUpgradeable.sol";

/**
 * @dev The contract module enhances the security of deploying and managing upgradable contracts in Hardhat and Foundry plugins.
 *
 * Inheriting from `InitWithAuthUpgradeable` will help you to protect your instance contract when initialize.
 * It can prevent hacker from calling initializer before you.
 * Inheriting from `InitWithAuthUpgradeable` will make the {initWithAuth} modifier
 * available, which can be applied to initializer function in logic contracts to make sure only authorized wallets are allowed to call.

 * NOTE: Only the deployer can call the initializer of instance contract.
 */
abstract contract InitWithAuthUpgradeable is Initializable, ContextUpgradeable {
    address public immutable INITOR;

    constructor() {
        INITOR = _msgSender();
    }

    // function __InitWithAuth_init() internal view onlyInitializing {
    //     require(_msgSender() == INITOR, " caller is not authenticated");
    // }

    // function __InitWithAuth_init_unchained() internal onlyInitializing {}

    modifier initWithAuth() {
        require(_msgSender() == INITOR, " caller is not authenticated");
        _;
    }
}
