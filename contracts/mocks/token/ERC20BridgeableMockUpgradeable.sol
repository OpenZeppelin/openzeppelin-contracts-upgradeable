// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {ERC20BridgeableUpgradeable} from "../../token/ERC20/extensions/draft-ERC20BridgeableUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

abstract contract ERC20BridgeableMockUpgradeable is Initializable, ERC20BridgeableUpgradeable {
    address private _bridge;

    error OnlyTokenBridge();
    event OnlyTokenBridgeFnCalled(address caller);

    function __ERC20BridgeableMock_init(address initialBridge) internal onlyInitializing {
        __ERC20BridgeableMock_init_unchained(initialBridge);
    }

    function __ERC20BridgeableMock_init_unchained(address initialBridge) internal onlyInitializing {
        _setBridge(initialBridge);
    }

    function _setBridge(address bridge) internal {
        _bridge = bridge;
    }

    function onlyTokenBridgeFn() external onlyTokenBridge {
        emit OnlyTokenBridgeFnCalled(msg.sender);
    }

    function _checkTokenBridge(address sender) internal view override {
        if (sender != _bridge) {
            revert OnlyTokenBridge();
        }
    }
}
