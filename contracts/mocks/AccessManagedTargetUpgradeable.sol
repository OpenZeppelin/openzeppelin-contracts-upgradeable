// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {AccessManagedUpgradeable} from "../access/manager/AccessManagedUpgradeable.sol";
import {IAccessManager} from "@openzeppelin/contracts/access/manager/IAccessManager.sol";
import {StorageSlot} from "@openzeppelin/contracts/utils/StorageSlot.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

abstract contract AccessManagedTargetUpgradeable is Initializable, AccessManagedUpgradeable {
    event CalledRestricted(address caller);
    event CalledUnrestricted(address caller);
    event CalledFallback(address caller);
    event StillExecuting(bool immediate);

    function __AccessManagedTarget_init() internal onlyInitializing {
    }

    function __AccessManagedTarget_init_unchained() internal onlyInitializing {
    }
    function fnRestricted() public restricted {
        emit CalledRestricted(msg.sender);
    }

    /// @dev Performs a nested {IAccessManager-execute}, then reports whether this call is still marked as executing.
    function fnRestrictedNested(address target, bytes calldata data) public restricted {
        IAccessManager(authority()).execute(target, data);
        // The nested call overwrote the execution identifier; it must have been restored before returning here.
        (bool immediate, ) = IAccessManager(authority()).canCall(authority(), address(this), msg.sig);
        emit StillExecuting(immediate);
    }

    function fnUnrestricted() public {
        emit CalledUnrestricted(msg.sender);
    }

    function setIsConsumingScheduledOp(bool isConsuming, bytes32 slot) external {
        // Memory layout is 0x....<_consumingSchedule (boolean)><authority (address)>
        bytes32 mask = bytes32(uint256(1 << 160));
        if (isConsuming) {
            StorageSlot.getBytes32Slot(slot).value |= mask;
        } else {
            StorageSlot.getBytes32Slot(slot).value &= ~mask;
        }
    }

    fallback() external {
        emit CalledFallback(msg.sender);
    }
}
