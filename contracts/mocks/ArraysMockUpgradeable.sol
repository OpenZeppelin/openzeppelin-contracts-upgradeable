// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Arrays} from "@openzeppelin/contracts/utils/Arrays.sol";
import {Initializable} from "../proxy/utils/Initializable.sol";

contract Uint256ArraysMockUpgradeable is Initializable {
    using Arrays for uint256[];

    uint256[] private _array;

    function __Uint256ArraysMock_init(uint256[] memory array) internal onlyInitializing {
        __Uint256ArraysMock_init_unchained(array);
    }

    function __Uint256ArraysMock_init_unchained(uint256[] memory array) internal onlyInitializing {
        _array = array;
    }

    function findUpperBound(uint256 value) external view returns (uint256) {
        return _array.findUpperBound(value);
    }

    function lowerBound(uint256 value) external view returns (uint256) {
        return _array.lowerBound(value);
    }

    function upperBound(uint256 value) external view returns (uint256) {
        return _array.upperBound(value);
    }

    function lowerBoundMemory(uint256[] memory array, uint256 value) external pure returns (uint256) {
        return array.lowerBoundMemory(value);
    }

    function upperBoundMemory(uint256[] memory array, uint256 value) external pure returns (uint256) {
        return array.upperBoundMemory(value);
    }

    function unsafeAccess(uint256 pos) external view returns (uint256) {
        return _array.unsafeAccess(pos).value;
    }

    function sort(uint256[] memory array) external pure returns (uint256[] memory) {
        return array.sort();
    }

    function sortReverse(uint256[] memory array) external pure returns (uint256[] memory) {
        return array.sort(_reverse);
    }

    function _reverse(uint256 a, uint256 b) private pure returns (bool) {
        return a > b;
    }

    function unsafeSetLength(uint256 newLength) external {
        _array.unsafeSetLength(newLength);
    }

    function length() external view returns (uint256) {
        return _array.length;
    }
}

contract AddressArraysMockUpgradeable is Initializable {
    using Arrays for address[];

    address[] private _array;

    function __AddressArraysMock_init(address[] memory array) internal onlyInitializing {
        __AddressArraysMock_init_unchained(array);
    }

    function __AddressArraysMock_init_unchained(address[] memory array) internal onlyInitializing {
        _array = array;
    }

    function unsafeAccess(uint256 pos) external view returns (address) {
        return _array.unsafeAccess(pos).value;
    }

    function sort(address[] memory array) external pure returns (address[] memory) {
        return array.sort();
    }

    function sortReverse(address[] memory array) external pure returns (address[] memory) {
        return array.sort(_reverse);
    }

    function _reverse(address a, address b) private pure returns (bool) {
        return uint160(a) > uint160(b);
    }

    function unsafeSetLength(uint256 newLength) external {
        _array.unsafeSetLength(newLength);
    }

    function length() external view returns (uint256) {
        return _array.length;
    }
}

contract Bytes32ArraysMockUpgradeable is Initializable {
    using Arrays for bytes32[];

    bytes32[] private _array;

    function __Bytes32ArraysMock_init(bytes32[] memory array) internal onlyInitializing {
        __Bytes32ArraysMock_init_unchained(array);
    }

    function __Bytes32ArraysMock_init_unchained(bytes32[] memory array) internal onlyInitializing {
        _array = array;
    }

    function unsafeAccess(uint256 pos) external view returns (bytes32) {
        return _array.unsafeAccess(pos).value;
    }

    function sort(bytes32[] memory array) external pure returns (bytes32[] memory) {
        return array.sort();
    }

    function sortReverse(bytes32[] memory array) external pure returns (bytes32[] memory) {
        return array.sort(_reverse);
    }

    function _reverse(bytes32 a, bytes32 b) private pure returns (bool) {
        return uint256(a) > uint256(b);
    }

    function unsafeSetLength(uint256 newLength) external {
        _array.unsafeSetLength(newLength);
    }

    function length() external view returns (uint256) {
        return _array.length;
    }
}
