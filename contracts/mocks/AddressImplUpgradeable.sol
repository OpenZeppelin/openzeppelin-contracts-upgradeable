// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../utils/AddressUpgradeable.sol";
import "../proxy/Initializable.sol";

contract AddressImplUpgradeable is Initializable {
    function __AddressImpl_init() internal initializer {
        __AddressImpl_init_unchained();
    }

    function __AddressImpl_init_unchained() internal initializer {
    }
    event CallReturnValue(string data);

    function isContract(address account) external view returns (bool) {
        return AddressUpgradeable.isContract(account);
    }

    function sendValue(address payable receiver, uint256 amount) external {
        AddressUpgradeable.sendValue(receiver, amount);
    }

    function functionCall(address target, bytes calldata data) external {
        bytes memory returnData = AddressUpgradeable.functionCall(target, data);

        emit CallReturnValue(abi.decode(returnData, (string)));
    }

    function functionCallWithValue(address target, bytes calldata data, uint256 value) external payable {
        bytes memory returnData = AddressUpgradeable.functionCallWithValue(target, data, value);

        emit CallReturnValue(abi.decode(returnData, (string)));
    }

    // sendValue's tests require the contract to hold Ether
    receive () external payable { }
    uint256[50] private __gap;
}
