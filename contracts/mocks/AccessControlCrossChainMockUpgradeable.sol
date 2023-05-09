// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "../access/AccessControlCrossChainUpgradeable.sol";
import "../crosschain/arbitrum/CrossChainEnabledArbitrumL2Upgradeable.sol";
import "../proxy/utils/Initializable.sol";

contract AccessControlCrossChainMockUpgradeable is Initializable, AccessControlCrossChainUpgradeable, CrossChainEnabledArbitrumL2Upgradeable {    function __AccessControlCrossChainMock_init() internal onlyInitializing {
    }

    function __AccessControlCrossChainMock_init_unchained() internal onlyInitializing {
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}
