// SPDX-License-Identifier: MIT

pragma solidity ^0.8.27;

import {IERC7786GatewaySource} from "@openzeppelin/contracts/interfaces/draft-IERC7786.sol";
import {ERC7786Recipient} from "@openzeppelin/contracts/crosschain/ERC7786Recipient.sol";
import {ERC7579Utils, Mode, CallType, ExecType} from "@openzeppelin/contracts/account/utils/draft-ERC7579Utils.sol";
import {Bytes} from "@openzeppelin/contracts/utils/Bytes.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

/**
 * @dev Helper contract used to relay transactions received from a controller through an ERC-7786 gateway. This is
 * used by the {GovernorCrosschain} governance module for the execution of cross-chain actions.
 *
 * A {CrosschainRemoteExecutor} address can be seen as the local identity of a remote executor on another chain. It
 * holds assets and permissions for the sake of its controller.
 */
contract CrosschainRemoteExecutorUpgradeable is Initializable, ERC7786Recipient {
    using Bytes for bytes;
    using ERC7579Utils for *;

    /// @custom:storage-location erc7201:openzeppelin.storage.CrosschainRemoteExecutor
    struct CrosschainRemoteExecutorStorage {
        /// @dev Gateway used by the remote controller to relay instructions to this executor.
        address _gateway;

        /// @dev InteroperableAddress of the remote controller that is allowed to relay instructions to this executor.
        bytes _controller;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.CrosschainRemoteExecutor")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant CrosschainRemoteExecutorStorageLocation = 0xc94e33a15f57bbc0c5cbe7e25f8dc0896436959887c81a5d1bd05a73aa47bf00;

    function _getCrosschainRemoteExecutorStorage() private pure returns (CrosschainRemoteExecutorStorage storage $) {
        assembly {
            $.slot := CrosschainRemoteExecutorStorageLocation
        }
    }

    /// @dev Emitted when the gateway or controller of this remote executor is updated.
    event CrosschainControllerSet(address gateway, bytes controller);

    /// @dev Reverted when a non-controller tries to relay instructions to this executor.
    error AccessRestricted();

    function __CrosschainRemoteExecutor_init(address initialGateway, bytes memory initialController) internal onlyInitializing {
        __CrosschainRemoteExecutor_init_unchained(initialGateway, initialController);
    }

    function __CrosschainRemoteExecutor_init_unchained(address initialGateway, bytes memory initialController) internal onlyInitializing {
        _setup(initialGateway, initialController);
    }

    /// @dev Accessor that returns the address of the gateway used by this remote executor.
    function gateway() public view virtual returns (address) {
        CrosschainRemoteExecutorStorage storage $ = _getCrosschainRemoteExecutorStorage();
        return $._gateway;
    }

    /**
     * @dev Accessor that returns the interoperable address of the controller allowed to relay instructions to this
     * remote executor.
     */
    function controller() public view virtual returns (bytes memory) {
        CrosschainRemoteExecutorStorage storage $ = _getCrosschainRemoteExecutorStorage();
        return $._controller;
    }

    /**
     * @dev Endpoint allowing the controller to reconfigure the executor. This must be called by the executor itself
     * following an instruction from the controller.
     */
    function reconfigure(address newGateway, bytes memory newController) public virtual {
        require(msg.sender == address(this), AccessRestricted());
        _setup(newGateway, newController);
    }

    /// @dev Internal setter to reconfigure the gateway and controller.
    function _setup(address gateway_, bytes memory controller_) internal virtual {
        CrosschainRemoteExecutorStorage storage $ = _getCrosschainRemoteExecutorStorage();
        // Sanity check, this should revert if gateway is not an ERC-7786 implementation. Note that since
        // supportsAttribute returns data, accounts without code would fail that test (nothing returned).
        IERC7786GatewaySource(gateway_).supportsAttribute(bytes4(0));

        $._gateway = gateway_;
        $._controller = controller_;

        emit CrosschainControllerSet(gateway_, controller_);
    }

    /// @inheritdoc ERC7786Recipient
    function _isAuthorizedGateway(
        address instance,
        bytes calldata sender
    ) internal view virtual override returns (bool) {
        return gateway() == instance && controller().equal(sender);
    }

    /// @inheritdoc ERC7786Recipient
    function _processMessage(
        address /*gateway*/,
        bytes32 /*receiveId*/,
        bytes calldata /*sender*/,
        bytes calldata payload
    ) internal virtual override {
        // split payload
        (CallType callType, ExecType execType, , ) = Mode.wrap(bytes32(payload[0x00:0x20])).decodeMode();
        bytes calldata executionCalldata = payload[0x20:];

        if (callType == ERC7579Utils.CALLTYPE_SINGLE) {
            executionCalldata.execSingle(execType);
        } else if (callType == ERC7579Utils.CALLTYPE_BATCH) {
            executionCalldata.execBatch(execType);
        } else if (callType == ERC7579Utils.CALLTYPE_DELEGATECALL) {
            executionCalldata.execDelegateCall(execType);
        } else revert ERC7579Utils.ERC7579UnsupportedCallType(callType);
    }
}
