// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../CountersImplUpgradeable.sol";
import "../../proxy/utils/UUPSUpgradeable.sol";
import "../../proxy/utils/Initializable.sol";

contract UUPSUpgradeableMockUpgradeable is Initializable, CountersImplUpgradeable, UUPSUpgradeable {
    function __UUPSUpgradeableMock_init() internal initializer {
        __CountersImpl_init_unchained();
        __ERC1967Upgrade_init_unchained();
        __UUPSUpgradeable_init_unchained();
        __UUPSUpgradeableMock_init_unchained();
    }

    function __UUPSUpgradeableMock_init_unchained() internal initializer {
    }
    // Not having any checks in this function is dangerous! Do not do this outside tests!
    function _authorizeUpgrade(address) internal virtual override {}
    uint256[50] private __gap;
}

contract UUPSUpgradeableUnsafeMockUpgradeable is Initializable, UUPSUpgradeableMockUpgradeable {
    function __UUPSUpgradeableUnsafeMock_init() internal initializer {
        __CountersImpl_init_unchained();
        __ERC1967Upgrade_init_unchained();
        __UUPSUpgradeable_init_unchained();
        __UUPSUpgradeableMock_init_unchained();
        __UUPSUpgradeableUnsafeMock_init_unchained();
    }

    function __UUPSUpgradeableUnsafeMock_init_unchained() internal initializer {
    }
    function upgradeTo(address newImplementation) external virtual override {
        ERC1967UpgradeUpgradeable._upgradeToAndCall(newImplementation, bytes(""), false);
    }

    function upgradeToAndCall(address newImplementation, bytes memory data) external payable virtual override {
        ERC1967UpgradeUpgradeable._upgradeToAndCall(newImplementation, data, false);
    }
    uint256[50] private __gap;
}

contract UUPSUpgradeableBrokenMockUpgradeable is Initializable, UUPSUpgradeableMockUpgradeable {
    function __UUPSUpgradeableBrokenMock_init() internal initializer {
        __CountersImpl_init_unchained();
        __ERC1967Upgrade_init_unchained();
        __UUPSUpgradeable_init_unchained();
        __UUPSUpgradeableMock_init_unchained();
        __UUPSUpgradeableBrokenMock_init_unchained();
    }

    function __UUPSUpgradeableBrokenMock_init_unchained() internal initializer {
    }
    function upgradeTo(address) external virtual override {
        // pass
    }

    function upgradeToAndCall(address, bytes memory) external payable virtual override {
        // pass
    }
    uint256[50] private __gap;
}
