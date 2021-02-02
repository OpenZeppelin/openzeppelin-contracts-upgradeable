// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

import "../utils/ContextUpgradeable.sol";
import "../proxy/Initializable.sol";

contract ContextMockUpgradeable is Initializable, ContextUpgradeable {
    function __ContextMock_init() internal initializer {
        __Context_init_unchained();
        __ContextMock_init_unchained();
    }

    function __ContextMock_init_unchained() internal initializer {
    }
    event Sender(address sender);

    function msgSender() public {
        emit Sender(_msgSender());
    }

    event Data(bytes data, uint256 integerValue, string stringValue);

    function msgData(uint256 integerValue, string memory stringValue) public {
        emit Data(_msgData(), integerValue, stringValue);
    }
    uint256[50] private __gap;
}

contract ContextMockCallerUpgradeable is Initializable {
    function __ContextMockCaller_init() internal initializer {
        __ContextMockCaller_init_unchained();
    }

    function __ContextMockCaller_init_unchained() internal initializer {
    }
    function callSender(ContextMockUpgradeable context) public {
        context.msgSender();
    }

    function callData(ContextMockUpgradeable context, uint256 integerValue, string memory stringValue) public {
        context.msgData(integerValue, stringValue);
    }
    uint256[50] private __gap;
}
