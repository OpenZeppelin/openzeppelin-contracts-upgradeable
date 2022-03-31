// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "../../access/OwnableUpgradeable.sol";
import "../../crosschain/amb/CrossChainEnabledAMBUpgradeable.sol";
import "../../crosschain/arbitrum/CrossChainEnabledArbitrumL1Upgradeable.sol";
import "../../crosschain/arbitrum/CrossChainEnabledArbitrumL2Upgradeable.sol";
import "../../crosschain/optimism/CrossChainEnabledOptimismUpgradeable.sol";
import "../../crosschain/polygon/CrossChainEnabledPolygonChildUpgradeable.sol";
import "../../proxy/utils/Initializable.sol";

abstract contract ReceiverUpgradeable is Initializable, OwnableUpgradeable, CrossChainEnabledUpgradeable {
    function __Receiver_init() internal onlyInitializing {
        __Ownable_init_unchained();
    }

    function __Receiver_init_unchained() internal onlyInitializing {
    }
    function crossChainRestricted() external onlyCrossChain {}

    function crossChainOwnerRestricted() external onlyCrossChainSender(owner()) {}

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}

/**
 * AMB
 */
contract CrossChainEnabledAMBMockUpgradeable is Initializable, ReceiverUpgradeable, CrossChainEnabledAMBUpgradeable {
    function __CrossChainEnabledAMBMock_init(address bridge) internal onlyInitializing {
        __Ownable_init_unchained();
    }

    function __CrossChainEnabledAMBMock_init_unchained(address) internal onlyInitializing {}

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}

/**
 * Arbitrum
 */
contract CrossChainEnabledArbitrumL1MockUpgradeable is Initializable, ReceiverUpgradeable, CrossChainEnabledArbitrumL1Upgradeable {
    function __CrossChainEnabledArbitrumL1Mock_init(address bridge) internal onlyInitializing {
        __Ownable_init_unchained();
    }

    function __CrossChainEnabledArbitrumL1Mock_init_unchained(address) internal onlyInitializing {}

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}

contract CrossChainEnabledArbitrumL2MockUpgradeable is Initializable, ReceiverUpgradeable, CrossChainEnabledArbitrumL2Upgradeable {    function __CrossChainEnabledArbitrumL2Mock_init() internal onlyInitializing {
        __Ownable_init_unchained();
    }

    function __CrossChainEnabledArbitrumL2Mock_init_unchained() internal onlyInitializing {
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}

/**
 * Optimism
 */
contract CrossChainEnabledOptimismMockUpgradeable is Initializable, ReceiverUpgradeable, CrossChainEnabledOptimismUpgradeable {
    function __CrossChainEnabledOptimismMock_init(address bridge) internal onlyInitializing {
        __Ownable_init_unchained();
    }

    function __CrossChainEnabledOptimismMock_init_unchained(address) internal onlyInitializing {}

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}

/**
 * Polygon
 */
contract CrossChainEnabledPolygonChildMockUpgradeable is Initializable, ReceiverUpgradeable, CrossChainEnabledPolygonChildUpgradeable {
    function __CrossChainEnabledPolygonChildMock_init(address bridge) internal onlyInitializing {
        __Ownable_init_unchained();
        __ReentrancyGuard_init_unchained();
    }

    function __CrossChainEnabledPolygonChildMock_init_unchained(address) internal onlyInitializing {}

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}
