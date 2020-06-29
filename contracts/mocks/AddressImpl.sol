// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../utils/Address.sol";
import "../Initializable.sol";

contract AddressImplUpgradeSafe is Initializable {
    constructor() public  {
        __AddressImpl_init();
    }

    function __AddressImpl_init() internal initializer {
        __AddressImpl_init_unchained();
    }

    function __AddressImpl_init_unchained() internal initializer {


    }

    event CallReturnValue(string data);

    function isContract(address account) external view returns (bool) {
        return Address.isContract(account);
    }

    function sendValue(address payable receiver, uint256 amount) external {
        Address.sendValue(receiver, amount);
    }

    function functionCall(address target, bytes calldata data) external {
        bytes memory returnData = Address.functionCall(target, data);

        emit CallReturnValue(abi.decode(returnData, (string)));
    }

    function functionCallWithValue(address target, bytes calldata data, uint256 value) external payable {
        bytes memory returnData = Address.functionCallWithValue(target, data, value);

        emit CallReturnValue(abi.decode(returnData, (string)));
    }

    // sendValue's tests require the contract to hold Ether
    receive () external payable { }

    uint256[50] private __gap;
}
