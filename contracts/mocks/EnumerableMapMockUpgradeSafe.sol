// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../utils/EnumerableMapUpgradeSafe.sol";
import "../Initializable.sol";

contract EnumerableMapMockUpgradeSafe is __Initializable {
    function __EnumerableMapMock_init() internal __initializer {
        __EnumerableMapMock_init_unchained();
    }

    function __EnumerableMapMock_init_unchained() internal __initializer {
    }
    using EnumerableMapUpgradeSafe for EnumerableMapUpgradeSafe.UintToAddressMap;

    event OperationResult(bool result);

    EnumerableMapUpgradeSafe.UintToAddressMap private _map;

    function contains(uint256 key) public view returns (bool) {
        return _map.contains(key);
    }

    function set(uint256 key, address value) public {
        bool result = _map.set(key, value);
        emit OperationResult(result);
    }

    function remove(uint256 key) public {
        bool result = _map.remove(key);
        emit OperationResult(result);
    }

    function length() public view returns (uint256) {
        return _map.length();
    }

    function at(uint256 index) public view returns (uint256 key, address value) {
        return _map.at(index);
    }


    function get(uint256 key) public view returns (address) {
        return _map.get(key);
    }
    uint256[48] private __gap;
}
