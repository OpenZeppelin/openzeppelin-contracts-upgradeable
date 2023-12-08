// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.8.0) (crosschain/arbitrum/CrossChainEnabledArbitrumL2.sol)

pragma solidity ^0.8.4;

import "../CrossChainEnabledUpgradeable.sol";
import "./LibArbitrumL2Upgradeable.sol";
import {Initializable} from "../../proxy/utils/Initializable.sol";

/**
 * @dev https://arbitrum.io/[Arbitrum] specialization or the
 * {CrossChainEnabled} abstraction the L2 side (arbitrum).
 *
 * This version should only be deployed on L2 to process cross-chain messages
 * originating from L1. For the other side, use {CrossChainEnabledArbitrumL1}.
 *
 * Arbitrum L2 includes the `ArbSys` contract at a fixed address. Therefore,
 * this specialization of {CrossChainEnabled} does not include a constructor.
 *
 * _Available since v4.6._
 *
 * WARNING: There is currently a bug in Arbitrum that causes this contract to
 * fail to detect cross-chain calls when deployed behind a proxy. This will be
 * fixed when the network is upgraded to Arbitrum Nitro, currently scheduled for
 * August 31st 2022.
 */
abstract contract CrossChainEnabledArbitrumL2Upgradeable is Initializable, CrossChainEnabledUpgradeable {
    function __CrossChainEnabledArbitrumL2_init() internal onlyInitializing {
    }

    function __CrossChainEnabledArbitrumL2_init_unchained() internal onlyInitializing {
    }
    /**
     * @dev see {CrossChainEnabled-_isCrossChain}
     */
    function _isCrossChain() internal view virtual override returns (bool) {
        return LibArbitrumL2Upgradeable.isCrossChain(LibArbitrumL2Upgradeable.ARBSYS);
    }

    /**
     * @dev see {CrossChainEnabled-_crossChainSender}
     */
    function _crossChainSender() internal view virtual override onlyCrossChain returns (address) {
        return LibArbitrumL2Upgradeable.crossChainSender(LibArbitrumL2Upgradeable.ARBSYS);
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}
