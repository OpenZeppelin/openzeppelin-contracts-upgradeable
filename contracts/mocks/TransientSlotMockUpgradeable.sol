// SPDX-License-Identifier: MIT
// This file was procedurally generated from scripts/generate/templates/TransientSlotMock.js.

pragma solidity ^0.8.24;

import {MulticallUpgradeable} from "../utils/MulticallUpgradeable.sol";
import {TransientSlot} from "@openzeppelin/contracts/utils/TransientSlot.sol";
import {Initializable} from "../proxy/utils/Initializable.sol";

contract TransientSlotMockUpgradeable is Initializable, MulticallUpgradeable {
    using TransientSlot for *;

    event AddressValue(bytes32 slot, address value);

    function __TransientSlotMock_init() internal onlyInitializing {
    }

    function __TransientSlotMock_init_unchained() internal onlyInitializing {
    }
    function tloadAddress(bytes32 slot) public {
        emit AddressValue(slot, slot.asAddress().tload());
    }

    function tstore(bytes32 slot, address value) public {
        slot.asAddress().tstore(value);
    }

    event BooleanValue(bytes32 slot, bool value);

    function tloadBoolean(bytes32 slot) public {
        emit BooleanValue(slot, slot.asBoolean().tload());
    }

    function tstore(bytes32 slot, bool value) public {
        slot.asBoolean().tstore(value);
    }

    event Bytes32Value(bytes32 slot, bytes32 value);

    function tloadBytes32(bytes32 slot) public {
        emit Bytes32Value(slot, slot.asBytes32().tload());
    }

    function tstore(bytes32 slot, bytes32 value) public {
        slot.asBytes32().tstore(value);
    }

    event Uint256Value(bytes32 slot, uint256 value);

    function tloadUint256(bytes32 slot) public {
        emit Uint256Value(slot, slot.asUint256().tload());
    }

    function tstore(bytes32 slot, uint256 value) public {
        slot.asUint256().tstore(value);
    }

    event Int256Value(bytes32 slot, int256 value);

    function tloadInt256(bytes32 slot) public {
        emit Int256Value(slot, slot.asInt256().tload());
    }

    function tstore(bytes32 slot, int256 value) public {
        slot.asInt256().tstore(value);
    }
}
