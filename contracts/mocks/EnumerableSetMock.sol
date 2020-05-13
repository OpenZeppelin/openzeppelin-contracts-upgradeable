pragma solidity ^0.6.0;

import "../utils/EnumerableSet.sol";
import "../Initializable.sol";

contract EnumerableSetMockUpgradeSafe is Initializable {
    constructor() public  {
        __EnumerableSetMock_init();
    }

    function __EnumerableSetMock_init() internal initializer {
        __EnumerableSetMock_init_unchained();
    }

    function __EnumerableSetMock_init_unchained() internal initializer {


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
