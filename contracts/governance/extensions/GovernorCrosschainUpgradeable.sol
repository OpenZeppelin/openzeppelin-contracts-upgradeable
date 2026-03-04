// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

import {GovernorUpgradeable} from "../GovernorUpgradeable.sol";
import {Mode} from "@openzeppelin/contracts/account/utils/draft-ERC7579Utils.sol";
import {ERC7786Recipient} from "@openzeppelin/contracts/crosschain/ERC7786Recipient.sol";
import {IERC7786GatewaySource} from "@openzeppelin/contracts/interfaces/draft-IERC7786.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

/// @dev Extension of {Governor} for cross-chain governance through ERC-7786 gateways and {CrosschainRemoteExecutor}.
abstract contract GovernorCrosschainUpgradeable is Initializable, GovernorUpgradeable {
    function __GovernorCrosschain_init() internal onlyInitializing {
    }

    function __GovernorCrosschain_init_unchained() internal onlyInitializing {
    }
    /// @dev Send crosschain instruction to an arbitrary remote executor via an arbitrary ERC-7786 gateway.
    function relayCrosschain(
        address gateway,
        bytes memory executor,
        Mode mode,
        bytes memory executionCalldata
    ) public virtual onlyGovernance {
        _crosschainExecute(gateway, executor, mode, executionCalldata);
    }

    /// @dev Send crosschain instruction to an arbitrary remote executor via an arbitrary ERC-7786 gateway.
    function _crosschainExecute(
        address gateway,
        bytes memory executor,
        Mode mode,
        bytes memory executionCalldata
    ) internal virtual {
        IERC7786GatewaySource(gateway).sendMessage(executor, abi.encodePacked(mode, executionCalldata), new bytes[](0));
    }
}
