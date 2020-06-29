// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../utils/EnumerableSet.sol";
import "../Initializable.sol";

// AddressSet
contract EnumerableAddressSetMockUpgradeSafe is Initializable {
    constructor() public  {
        __EnumerableAddressSetMock_init();
    }

    function __EnumerableAddressSetMock_init() internal initializer {
        __EnumerableAddressSetMock_init_unchained();
    }

    function __EnumerableAddressSetMock_init_unchained() internal initializer {


    }

    using EnumerableSet for EnumerableSet.AddressSet;

    event OperationResult(bool result);

    EnumerableSet.AddressSet private _set;

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

    uint256[48] private __gap;
}

// UintSet
contract EnumerableUintSetMockUpgradeSafe is Initializable {
    constructor() public  {
        __EnumerableUintSetMock_init();
    }

    function __EnumerableUintSetMock_init() internal initializer {
        __EnumerableUintSetMock_init_unchained();
    }

    function __EnumerableUintSetMock_init_unchained() internal initializer {


    }

    using EnumerableSet for EnumerableSet.UintSet;

    event OperationResult(bool result);

    EnumerableSet.UintSet private _set;

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

    uint256[48] private __gap;
}
