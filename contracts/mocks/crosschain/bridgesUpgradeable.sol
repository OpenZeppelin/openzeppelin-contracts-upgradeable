// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../../utils/AddressUpgradeable.sol";
import "../../vendor/polygon/IFxMessageProcessorUpgradeable.sol";
import "../../proxy/utils/Initializable.sol";

abstract contract BaseRelayMockUpgradeable is Initializable {
    function __BaseRelayMock_init() internal onlyInitializing {
    }

    function __BaseRelayMock_init_unchained() internal onlyInitializing {
    }
    // needed to parse custom errors
    error NotCrossChainCall();
    error InvalidCrossChainSender(address sender, address expected);

    address internal _currentSender;

    function relayAs(
        address target,
        bytes calldata data,
        address sender
    ) external virtual {
        address previousSender = _currentSender;

        _currentSender = sender;

        (bool success, bytes memory returndata) = target.call(data);
        AddressUpgradeable.verifyCallResultFromTarget(target, success, returndata, "low-level call reverted");

        _currentSender = previousSender;
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[49] private __gap;
}

/**
 * AMB
 */
contract BridgeAMBMockUpgradeable is Initializable, BaseRelayMockUpgradeable {
    function __BridgeAMBMock_init() internal onlyInitializing {
    }

    function __BridgeAMBMock_init_unchained() internal onlyInitializing {
    }
    function messageSender() public view returns (address) {
        return _currentSender;
    }

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
contract BridgeArbitrumL1MockUpgradeable is Initializable, BaseRelayMockUpgradeable {
    function __BridgeArbitrumL1Mock_init() internal onlyInitializing {
    }

    function __BridgeArbitrumL1Mock_init_unchained() internal onlyInitializing {
    }
    /// @custom:oz-upgrades-unsafe-allow state-variable-immutable state-variable-assignment
    address public immutable inbox = address(new BridgeArbitrumL1InboxUpgradeable());
    /// @custom:oz-upgrades-unsafe-allow state-variable-immutable state-variable-assignment
    address public immutable outbox = address(new BridgeArbitrumL1OutboxUpgradeable());

    function activeOutbox() public view returns (address) {
        return outbox;
    }

    function currentSender() public view returns (address) {
        return _currentSender;
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}

contract BridgeArbitrumL1InboxUpgradeable is Initializable {
    function __BridgeArbitrumL1Inbox_init() internal onlyInitializing {
    }

    function __BridgeArbitrumL1Inbox_init_unchained() internal onlyInitializing {
    }
    /// @custom:oz-upgrades-unsafe-allow state-variable-immutable state-variable-assignment
    address public immutable bridge = msg.sender;

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}

contract BridgeArbitrumL1OutboxUpgradeable is Initializable {
    function __BridgeArbitrumL1Outbox_init() internal onlyInitializing {
    }

    function __BridgeArbitrumL1Outbox_init_unchained() internal onlyInitializing {
    }
    /// @custom:oz-upgrades-unsafe-allow state-variable-immutable state-variable-assignment
    address public immutable bridge = msg.sender;

    function l2ToL1Sender() public view returns (address) {
        return BridgeArbitrumL1MockUpgradeable(bridge).currentSender();
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}

contract BridgeArbitrumL2MockUpgradeable is Initializable, BaseRelayMockUpgradeable {
    function __BridgeArbitrumL2Mock_init() internal onlyInitializing {
    }

    function __BridgeArbitrumL2Mock_init_unchained() internal onlyInitializing {
    }
    function wasMyCallersAddressAliased() public view returns (bool) {
        return _currentSender != address(0);
    }

    function myCallersAddressWithoutAliasing() public view returns (address) {
        return _currentSender;
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
contract BridgeOptimismMockUpgradeable is Initializable, BaseRelayMockUpgradeable {
    function __BridgeOptimismMock_init() internal onlyInitializing {
    }

    function __BridgeOptimismMock_init_unchained() internal onlyInitializing {
    }
    function xDomainMessageSender() public view returns (address) {
        return _currentSender;
    }

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
contract BridgePolygonChildMockUpgradeable is Initializable, BaseRelayMockUpgradeable {
    function __BridgePolygonChildMock_init() internal onlyInitializing {
    }

    function __BridgePolygonChildMock_init_unchained() internal onlyInitializing {
    }
    function relayAs(
        address target,
        bytes calldata data,
        address sender
    ) external override {
        IFxMessageProcessorUpgradeable(target).processMessageFromRoot(0, sender, data);
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}
