// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;
import "../Initializable.sol";

contract CallReceiverMockUpgradeSafe is Initializable {
    constructor() public  {
        __CallReceiverMock_init();
    }

    function __CallReceiverMock_init() internal initializer {
        __CallReceiverMock_init_unchained();
    }

    function __CallReceiverMock_init_unchained() internal initializer {


    }


    event MockFunctionCalled();

    uint256[] private _array;

    function mockFunction() public payable returns (string memory) {
        emit MockFunctionCalled();

        return "0x1234";
    }

    function mockFunctionNonPayable() public returns (string memory) {
        emit MockFunctionCalled();

        return "0x1234";
    }

    function mockFunctionRevertsNoReason() public payable {
        revert();
    }

    function mockFunctionRevertsReason() public payable {
        revert("CallReceiverMock: reverting");
    }

    function mockFunctionThrows() public payable {
        assert(false);
    }

    function mockFunctionOutOfGas() public payable {
        for (uint256 i = 0; ; ++i) {
            _array.push(i);
        }
    }

    uint256[49] private __gap;
}
