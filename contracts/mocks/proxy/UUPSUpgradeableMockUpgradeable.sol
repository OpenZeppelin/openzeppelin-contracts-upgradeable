// SPDX-License-Identifier: MIT

pragma solidity ^0.8.22;

import {UUPSUpgradeable} from "@openzeppelin/contracts/proxy/utils/UUPSUpgradeable.sol";
import {ERC1967Utils} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Utils.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

contract NonUpgradeableMockUpgradeable is Initializable {
    uint256 internal _counter;

    function __NonUpgradeableMock_init() internal onlyInitializing {
    }

    function __NonUpgradeableMock_init_unchained() internal onlyInitializing {
    }
    function current() external view returns (uint256) {
        return _counter;
    }

    function increment() external {
        ++_counter;
    }
}

contract UUPSUpgradeableMockUpgradeable is Initializable, NonUpgradeableMockUpgradeable, UUPSUpgradeable {
    function __UUPSUpgradeableMock_init() internal onlyInitializing {
    }

    function __UUPSUpgradeableMock_init_unchained() internal onlyInitializing {
    }
    // Not having any checks in this function is dangerous! Do not do this outside tests!
    function _authorizeUpgrade(address) internal override {}
}

contract UUPSUpgradeableUnsafeMockUpgradeable is Initializable, UUPSUpgradeableMockUpgradeable {
    function __UUPSUpgradeableUnsafeMock_init() internal onlyInitializing {
    }

    function __UUPSUpgradeableUnsafeMock_init_unchained() internal onlyInitializing {
    }
    function upgradeToAndCall(address newImplementation, bytes memory data) public payable override {
        ERC1967Utils.upgradeToAndCall(newImplementation, data);
    }
}

contract UUPSUnsupportedProxiableUUIDMockUpgradeable is Initializable, NonUpgradeableMockUpgradeable {
    function __UUPSUnsupportedProxiableUUIDMock_init() internal onlyInitializing {
    }

    function __UUPSUnsupportedProxiableUUIDMock_init_unchained() internal onlyInitializing {
    }
    function proxiableUUID() external pure returns (bytes32) {
        return keccak256("invalid UUID");
    }
}
