// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";
import {Initializable} from "../proxy/utils/Initializable.sol";

contract Base64DirtyUpgradeable is Initializable {
    struct A {
        uint256 value;
    }

    function __Base64Dirty_init() internal onlyInitializing {
    }

    function __Base64Dirty_init_unchained() internal onlyInitializing {
    }
    function encode(bytes memory input) public pure returns (string memory) {
        A memory unused = A({value: type(uint256).max});
        // To silence warning
        unused;

        return Base64.encode(input);
    }
}
