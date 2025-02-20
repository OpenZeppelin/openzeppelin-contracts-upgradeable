// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Address} from "@openzeppelin/contracts/utils/Address.sol";
import {Initializable} from "../proxy/utils/Initializable.sol";

contract BatchCallerUpgradeable is Initializable {
    struct Call {
        address target;
        uint256 value;
        bytes data;
    }

    function __BatchCaller_init() internal onlyInitializing {
    }

    function __BatchCaller_init_unchained() internal onlyInitializing {
    }
    function execute(Call[] calldata calls) external returns (bytes[] memory) {
        bytes[] memory returndata = new bytes[](calls.length);
        for (uint256 i = 0; i < calls.length; ++i) {
            returndata[i] = Address.functionCallWithValue(calls[i].target, calls[i].data, calls[i].value);
        }
        return returndata;
    }
}
