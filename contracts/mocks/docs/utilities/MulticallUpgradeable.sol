// contracts/Box.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {MulticallUpgradeable} from "../../../utils/MulticallUpgradeable.sol";
import {Initializable} from "../../../proxy/utils/Initializable.sol";

contract BoxUpgradeable is Initializable, MulticallUpgradeable {
    function __Box_init() internal onlyInitializing {
    }

    function __Box_init_unchained() internal onlyInitializing {
    }
    function foo() public {
        // ...
    }

    function bar() public {
        // ...
    }
}
