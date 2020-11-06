// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../GSN/ContextUpgradeSafe.sol";
import "../Initializable.sol";

contract ContextMockUpgradeSafe is __Initializable, ContextUpgradeSafe {
    function __ContextMock_init() internal __initializer {
        __Context_init_unchained();
        __ContextMock_init_unchained();
    }

    function __ContextMock_init_unchained() internal __initializer {
    }
    event Sender(address sender);

    function msgSender() public {
        emit Sender(_msgSender());
    }

    event Data(bytes data, uint256 integerValue, string stringValue);

    function msgData(uint256 integerValue, string memory stringValue) public {
        emit Data(_msgData(), integerValue, stringValue);
    }
}

contract ContextMockCallerUpgradeSafe is __Initializable {
    function __ContextMockCaller_init() internal __initializer {
        __ContextMockCaller_init_unchained();
    }

    function __ContextMockCaller_init_unchained() internal __initializer {
    }
    function callSender(ContextMockUpgradeSafe context) public {
        context.msgSender();
    }

    function callData(ContextMockUpgradeSafe context, uint256 integerValue, string memory stringValue) public {
        context.msgData(integerValue, stringValue);
    }
}
