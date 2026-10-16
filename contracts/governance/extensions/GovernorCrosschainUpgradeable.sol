// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.7.0) (governance/extensions/GovernorCrosschain.sol)

pragma solidity ^0.8.26;

import {Mode} from "@openzeppelin/contracts/account/utils/draft-ERC7579Utils.sol";
import {IERC7786GatewaySource} from "@openzeppelin/contracts/interfaces/IERC7786.sol";
import {GovernorUpgradeable} from "../GovernorUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

/// @dev Extension of {Governor} for cross-chain governance through ERC-7786 gateways and {CrosschainRemoteExecutor}.
abstract contract GovernorCrosschainUpgradeable is Initializable, GovernorUpgradeable {
    function __GovernorCrosschain_init() internal onlyInitializing {
    }

    function __GovernorCrosschain_init_unchained() internal onlyInitializing {
    }
    /**
     * @dev Send crosschain instruction to an arbitrary remote executor via an arbitrary ERC-7786 gateway.
     *
     * Any value sent with this call is forwarded to the gateway. Returns the `sendId` reported by the gateway
     * (see {IERC7786GatewaySource-sendMessage}).
     */
    function relayCrosschain(
        address gateway,
        bytes memory executor,
        Mode mode,
        bytes memory executionCalldata
    ) public payable virtual onlyGovernance returns (bytes32) {
        return _crosschainExecute(gateway, executor, mode, executionCalldata, msg.value);
    }

    /**
     * @dev Send crosschain instruction to an arbitrary remote executor via an arbitrary ERC-7786 gateway, forwarding
     * `value` to the gateway. Returns the gateway's `sendId`.
     */
    function _crosschainExecute(
        address gateway,
        bytes memory executor,
        Mode mode,
        bytes memory executionCalldata,
        uint256 value
    ) internal virtual returns (bytes32) {
        return
            IERC7786GatewaySource(gateway).sendMessage{value: value}(
                executor,
                abi.encodePacked(mode, executionCalldata),
                new bytes[](0)
            );
    }
}
