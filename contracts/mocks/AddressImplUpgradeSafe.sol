// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../utils/AddressUpgradeSafe.sol";
import "../Initializable.sol";

contract AddressImplUpgradeSafe is __Initializable {
    function __AddressImpl_init() internal __initializer {
        __AddressImpl_init_unchained();
    }

    function __AddressImpl_init_unchained() internal __initializer {
    }
    string public sharedAnswer;

    event CallReturnValue(string data);

    function isContract(address account) external view returns (bool) {
        return AddressUpgradeSafe.isContract(account);
    }

    function sendValue(address payable receiver, uint256 amount) external {
        AddressUpgradeSafe.sendValue(receiver, amount);
    }

    function functionCall(address target, bytes calldata data) external {
        bytes memory returnData = AddressUpgradeSafe.functionCall(target, data);
        emit CallReturnValue(abi.decode(returnData, (string)));
    }

    function functionCallWithValue(address target, bytes calldata data, uint256 value) external payable {
        bytes memory returnData = AddressUpgradeSafe.functionCallWithValue(target, data, value);
        emit CallReturnValue(abi.decode(returnData, (string)));
    }

    function functionStaticCall(address target, bytes calldata data) external {
        bytes memory returnData = AddressUpgradeSafe.functionStaticCall(target, data);
        emit CallReturnValue(abi.decode(returnData, (string)));
    }

    function functionDelegateCall(address target, bytes calldata data) external {
        bytes memory returnData = AddressUpgradeSafe.functionDelegateCall(target, data);
        emit CallReturnValue(abi.decode(returnData, (string)));
    }

    // sendValue's tests require the contract to hold Ether
    receive () external payable { }
    uint256[49] private __gap;
}
