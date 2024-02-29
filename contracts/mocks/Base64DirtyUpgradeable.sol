// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Base64Upgradeable} from "../utils/Base64Upgradeable.sol";
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

        return Base64Upgradeable.encode(input);
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}
