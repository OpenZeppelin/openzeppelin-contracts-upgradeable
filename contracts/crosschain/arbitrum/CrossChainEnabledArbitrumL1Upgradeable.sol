// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.7.0) (crosschain/arbitrum/CrossChainEnabledArbitrumL1.sol)

pragma solidity ^0.8.4;

import "../CrossChainEnabledUpgradeable.sol";
import "./LibArbitrumL1Upgradeable.sol";
import {Initializable} from "../../proxy/utils/Initializable.sol";

/**
 * @dev https://arbitrum.io/[Arbitrum] specialization or the
 * {CrossChainEnabled} abstraction the L1 side (mainnet).
 *
 * This version should only be deployed on L1 to process cross-chain messages
 * originating from L2. For the other side, use {CrossChainEnabledArbitrumL2}.
 *
 * The bridge contract is provided and maintained by the arbitrum team. You can
 * find the address of this contract on the rinkeby testnet in
 * https://developer.offchainlabs.com/docs/useful_addresses[Arbitrum's developer documentation].
 *
 * _Available since v4.6._
 */
abstract contract CrossChainEnabledArbitrumL1Upgradeable is Initializable, CrossChainEnabledUpgradeable {
    /// @custom:oz-upgrades-unsafe-allow state-variable-immutable
    address private immutable _bridge;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor(address bridge) {
        _bridge = bridge;
    }

    /**
     * @dev see {CrossChainEnabled-_isCrossChain}
     */
    function _isCrossChain() internal view virtual override returns (bool) {
        return LibArbitrumL1Upgradeable.isCrossChain(_bridge);
    }

    /**
     * @dev see {CrossChainEnabled-_crossChainSender}
     */
    function _crossChainSender() internal view virtual override onlyCrossChain returns (address) {
        return LibArbitrumL1Upgradeable.crossChainSender(_bridge);
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}
