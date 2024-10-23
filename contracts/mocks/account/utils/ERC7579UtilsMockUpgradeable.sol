// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {CallType, ExecType, ModeSelector, ModePayload} from "@openzeppelin/contracts/account/utils/draft-ERC7579Utils.sol";
import {Initializable} from "../../../proxy/utils/Initializable.sol";

contract ERC7579UtilsGlobalMockUpgradeable is Initializable {
    function __ERC7579UtilsGlobalMock_init() internal onlyInitializing {
    }

    function __ERC7579UtilsGlobalMock_init_unchained() internal onlyInitializing {
    }
    function eqCallTypeGlobal(CallType callType1, CallType callType2) internal pure returns (bool) {
        return callType1 == callType2;
    }

    function eqExecTypeGlobal(ExecType execType1, ExecType execType2) internal pure returns (bool) {
        return execType1 == execType2;
    }

    function eqModeSelectorGlobal(ModeSelector modeSelector1, ModeSelector modeSelector2) internal pure returns (bool) {
        return modeSelector1 == modeSelector2;
    }

    function eqModePayloadGlobal(ModePayload modePayload1, ModePayload modePayload2) internal pure returns (bool) {
        return modePayload1 == modePayload2;
    }
}
