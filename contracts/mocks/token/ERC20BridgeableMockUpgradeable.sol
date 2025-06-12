// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {ERC20Upgradeable, ERC20BridgeableUpgradeable} from "../../token/ERC20/extensions/draft-ERC20BridgeableUpgradeable.sol";
import {Initializable} from "../../proxy/utils/Initializable.sol";

abstract contract ERC20BridgeableMockUpgradeable is Initializable, ERC20BridgeableUpgradeable {
    address private _bridge;

    error OnlyTokenBridge();
    event OnlyTokenBridgeFnCalled(address caller);

    function __ERC20BridgeableMock_init(address bridge) internal onlyInitializing {
        __ERC20BridgeableMock_init_unchained(bridge);
    }

    function __ERC20BridgeableMock_init_unchained(address bridge) internal onlyInitializing {
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
