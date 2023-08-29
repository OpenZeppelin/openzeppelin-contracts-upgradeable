// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import { IBeaconUpgradeable } from "../proxy/beacon/IBeaconUpgradeable.sol";
import "../proxy/utils/Initializable.sol";

contract UpgradeableBeaconMockUpgradeable is Initializable, IBeaconUpgradeable {
    address public implementation;

    function __UpgradeableBeaconMock_init(address impl) internal onlyInitializing {
        __UpgradeableBeaconMock_init_unchained(impl);
    }

    function __UpgradeableBeaconMock_init_unchained(address impl) internal onlyInitializing {
        implementation = impl;
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[49] private __gap;
}

interface IProxyExposedUpgradeable {
    // solhint-disable-next-line func-name-mixedcase
    function $getBeacon() external view returns (address);
}

contract UpgradeableBeaconReentrantMockUpgradeable is Initializable, IBeaconUpgradeable {
    error BeaconProxyBeaconSlotAddress(address beacon);

    function __UpgradeableBeaconReentrantMock_init() internal onlyInitializing {
    }

    function __UpgradeableBeaconReentrantMock_init_unchained() internal onlyInitializing {
    }
    function implementation() external view override returns (address) {
        // Revert with the beacon seen in the proxy at the moment of calling to check if it's
        // set before the call.
        revert BeaconProxyBeaconSlotAddress(IProxyExposedUpgradeable(msg.sender).$getBeacon());
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}
