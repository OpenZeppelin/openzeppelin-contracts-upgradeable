// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../access/OwnableUpgradeSafe.sol";
import "./TransparentUpgradeableProxyUpgradeSafe.sol";
import "../Initializable.sol";

/**
 * @dev This is an auxiliary contract meant to be assigned as the admin of a {TransparentUpgradeableProxy}. For an
 * explanation of why you would want to use this see the documentation for {TransparentUpgradeableProxy}.
 */
contract ProxyAdminUpgradeSafe is __Initializable, OwnableUpgradeSafe {
    function __ProxyAdmin_init() internal __initializer {
        __Context_init_unchained();
        __Ownable_init_unchained();
        __ProxyAdmin_init_unchained();
    }

    function __ProxyAdmin_init_unchained() internal __initializer {
    }

    /**
     * @dev Returns the current implementation of `proxy`.
     * 
     * Requirements:
     * 
     * - This contract must be the admin of `proxy`.
     */
    function getProxyImplementation(TransparentUpgradeableProxyUpgradeSafe proxy) public view returns (address) {
        // We need to manually run the static call since the getter cannot be flagged as view
        // bytes4(keccak256("implementation()")) == 0x5c60da1b
        (bool success, bytes memory returndata) = address(proxy).staticcall(hex"5c60da1b");
        require(success);
        return abi.decode(returndata, (address));
    }

    /**
     * @dev Returns the current admin of `proxy`.
     * 
     * Requirements:
     * 
     * - This contract must be the admin of `proxy`.
     */
    function getProxyAdmin(TransparentUpgradeableProxyUpgradeSafe proxy) public view returns (address) {
        // We need to manually run the static call since the getter cannot be flagged as view
        // bytes4(keccak256("admin()")) == 0xf851a440
        (bool success, bytes memory returndata) = address(proxy).staticcall(hex"f851a440");
        require(success);
        return abi.decode(returndata, (address));
    }

    /**
     * @dev Changes the admin of `proxy` to `newAdmin`.
     * 
     * Requirements:
     * 
     * - This contract must be the current admin of `proxy`.
     */
    function changeProxyAdmin(TransparentUpgradeableProxyUpgradeSafe proxy, address newAdmin) public onlyOwner {
        proxy.changeAdmin(newAdmin);
    }

    /**
     * @dev Upgrades `proxy` to `implementation`. See {TransparentUpgradeableProxy-upgradeTo}.
     * 
     * Requirements:
     * 
     * - This contract must be the admin of `proxy`.
     */
    function upgrade(TransparentUpgradeableProxyUpgradeSafe proxy, address implementation) public onlyOwner {
        proxy.upgradeTo(implementation);
    }

    /**
     * @dev Upgrades `proxy` to `implementation` and calls a function on the new implementation. See
     * {TransparentUpgradeableProxy-upgradeToAndCall}.
     * 
     * Requirements:
     * 
     * - This contract must be the admin of `proxy`.
     */
    function upgradeAndCall(TransparentUpgradeableProxyUpgradeSafe proxy, address implementation, bytes memory data) public payable onlyOwner {
        proxy.upgradeToAndCall{value: msg.value}(implementation, data);
    }
}
