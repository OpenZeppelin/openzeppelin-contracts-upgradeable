// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.6.0) (crosschain/polygon/CrossChainEnabledPolygonChild.sol)

pragma solidity ^0.8.4;

import "../CrossChainEnabledUpgradeable.sol";
import "../../security/ReentrancyGuardUpgradeable.sol";
import "../../utils/AddressUpgradeable.sol";
import "../../vendor/polygon/IFxMessageProcessorUpgradeable.sol";
import "../../proxy/utils/Initializable.sol";

address constant DEFAULT_SENDER = 0x000000000000000000000000000000000000dEaD;

/**
 * @dev [Polygon](https://polygon.technology/) specialization or the
 * {CrossChainEnabled} abstraction the child side (polygon/mumbai).
 *
 * This version should only be deployed on child chain to process cross-chain
 * messages originating from the parent chain.
 *
 * The fxChild contract is provided and maintained by the polygon team. You can
 * find the address of this contract polygon and mumbai in
 * [Polygon's Fx-Portal documentation](https://docs.polygon.technology/docs/develop/l1-l2-communication/fx-portal/#contract-addresses).
 *
 * _Available since v4.6._
 */
abstract contract CrossChainEnabledPolygonChildUpgradeable is Initializable, IFxMessageProcessorUpgradeable, CrossChainEnabledUpgradeable, ReentrancyGuardUpgradeable {
    /// @custom:oz-upgrades-unsafe-allow state-variable-immutable
    address private immutable _fxChild;
    address private _sender = DEFAULT_SENDER;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor(address fxChild) {
        _fxChild = fxChild;
    }

    /**
     * @dev see {CrossChainEnabled-_isCrossChain}
     */
    function _isCrossChain() internal view virtual override returns (bool) {
        return msg.sender == _fxChild;
    }

    /**
     * @dev see {CrossChainEnabled-_crossChainSender}
     */
    function _crossChainSender() internal view virtual override onlyCrossChain returns (address) {
        return _sender;
    }

    /**
     * @dev External entry point to receive and relay messages originating
     * from the fxChild.
     *
     * Non-reentrancy is crucial to avoid a cross-chain call being able
     * to impersonate anyone by just looping through this with user-defined
     * arguments.
     *
     * Note: if _fxChild calls any other function that does a delegate-call,
     * then security could be compromised.
     */
    function processMessageFromRoot(
        uint256, /* stateId */
        address rootMessageSender,
        bytes calldata data
    ) external override nonReentrant {
        require(msg.sender == _fxChild, "unauthorized cross-chain relay");

        _sender = rootMessageSender;
        __functionDelegateCall(address(this), data);
        _sender = DEFAULT_SENDER;
    }

    // ERC1967Upgrade._functionDelegateCall is private so we reproduce it here.
    // An extra underscore prevents a name clash error.
    function __functionDelegateCall(address target, bytes memory data) private returns (bytes memory) {
        require(AddressUpgradeable.isContract(target), "Address: delegate call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.delegatecall(data);
        return AddressUpgradeable.verifyCallResult(success, returndata, "Address: low-level delegate call failed");
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[49] private __gap;
}
