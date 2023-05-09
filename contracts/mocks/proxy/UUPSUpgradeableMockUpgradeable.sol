// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../../proxy/utils/UUPSUpgradeable.sol";
import "../../utils/CountersUpgradeable.sol";
import "../../proxy/utils/Initializable.sol";

contract NonUpgradeableMockUpgradeable is Initializable {
    function __NonUpgradeableMock_init() internal onlyInitializing {
    }

    function __NonUpgradeableMock_init_unchained() internal onlyInitializing {
    }
    CountersUpgradeable.Counter internal _counter;

    function current() external view returns (uint256) {
        return CountersUpgradeable.current(_counter);
    }

    function increment() external {
        return CountersUpgradeable.increment(_counter);
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[49] private __gap;
}

contract UUPSUpgradeableMockUpgradeable is Initializable, NonUpgradeableMockUpgradeable, UUPSUpgradeable {
    function __UUPSUpgradeableMock_init() internal onlyInitializing {
    }

    function __UUPSUpgradeableMock_init_unchained() internal onlyInitializing {
    }
    // Not having any checks in this function is dangerous! Do not do this outside tests!
    function _authorizeUpgrade(address) internal override {}

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}

contract UUPSUpgradeableUnsafeMockUpgradeable is Initializable, UUPSUpgradeableMockUpgradeable {
    function __UUPSUpgradeableUnsafeMock_init() internal onlyInitializing {
    }

    function __UUPSUpgradeableUnsafeMock_init_unchained() internal onlyInitializing {
    }
    function upgradeTo(address newImplementation) public override {
        ERC1967UpgradeUpgradeable._upgradeToAndCall(newImplementation, bytes(""), false);
    }

    function upgradeToAndCall(address newImplementation, bytes memory data) public payable override {
        ERC1967UpgradeUpgradeable._upgradeToAndCall(newImplementation, data, false);
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}
