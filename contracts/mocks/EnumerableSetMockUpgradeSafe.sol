// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../utils/EnumerableSetUpgradeSafe.sol";
import "../Initializable.sol";

// Bytes32Set
contract EnumerableBytes32SetMockUpgradeSafe is __Initializable {
    function __EnumerableBytes32SetMock_init() internal __initializer {
        __EnumerableBytes32SetMock_init_unchained();
    }

    function __EnumerableBytes32SetMock_init_unchained() internal __initializer {
    }
    using EnumerableSetUpgradeSafe for EnumerableSetUpgradeSafe.Bytes32Set;

    event OperationResult(bool result);

    EnumerableSetUpgradeSafe.Bytes32Set private _set;

    function contains(bytes32 value) public view returns (bool) {
        return _set.contains(value);
    }

    function add(bytes32 value) public {
        bool result = _set.add(value);
        emit OperationResult(result);
    }

    function remove(bytes32 value) public {
        bool result = _set.remove(value);
        emit OperationResult(result);
    }

    function length() public view returns (uint256) {
        return _set.length();
    }

    function at(uint256 index) public view returns (bytes32) {
        return _set.at(index);
    }
}

// AddressSet
contract EnumerableAddressSetMockUpgradeSafe is __Initializable {
    function __EnumerableAddressSetMock_init() internal __initializer {
        __EnumerableAddressSetMock_init_unchained();
    }

    function __EnumerableAddressSetMock_init_unchained() internal __initializer {
    }
    using EnumerableSetUpgradeSafe for EnumerableSetUpgradeSafe.AddressSet;

    event OperationResult(bool result);

    EnumerableSetUpgradeSafe.AddressSet private _set;

    function contains(address value) public view returns (bool) {
        return _set.contains(value);
    }

    function add(address value) public {
        bool result = _set.add(value);
        emit OperationResult(result);
    }

    function remove(address value) public {
        bool result = _set.remove(value);
        emit OperationResult(result);
    }

    function length() public view returns (uint256) {
        return _set.length();
    }

    function at(uint256 index) public view returns (address) {
        return _set.at(index);
    }
}

// UintSet
contract EnumerableUintSetMockUpgradeSafe is __Initializable {
    function __EnumerableUintSetMock_init() internal __initializer {
        __EnumerableUintSetMock_init_unchained();
    }

    function __EnumerableUintSetMock_init_unchained() internal __initializer {
    }
    using EnumerableSetUpgradeSafe for EnumerableSetUpgradeSafe.UintSet;

    event OperationResult(bool result);

    EnumerableSetUpgradeSafe.UintSet private _set;

    function contains(uint256 value) public view returns (bool) {
        return _set.contains(value);
    }

    function add(uint256 value) public {
        bool result = _set.add(value);
        emit OperationResult(result);
    }

    function remove(uint256 value) public {
        bool result = _set.remove(value);
        emit OperationResult(result);
    }

    function length() public view returns (uint256) {
        return _set.length();
    }

    function at(uint256 index) public view returns (uint256) {
        return _set.at(index);
    }
}
