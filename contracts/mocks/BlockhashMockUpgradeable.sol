// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Blockhash} from "@openzeppelin/contracts/utils/Blockhash.sol";
import {Initializable} from "../proxy/utils/Initializable.sol";

/// @dev This mock is required for upgradeable tests to pass
contract BlockhashMockUpgradeable is Initializable {
    function __BlockhashMock_init() internal onlyInitializing {
    }

    function __BlockhashMock_init_unchained() internal onlyInitializing {
    }

}
