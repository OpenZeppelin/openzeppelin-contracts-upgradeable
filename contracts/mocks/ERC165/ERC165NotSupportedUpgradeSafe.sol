// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;
import "../../Initializable.sol";

contract ERC165NotSupportedUpgradeSafe is __Initializable {    function __ERC165NotSupported_init() internal __initializer {
        __ERC165NotSupported_init_unchained();
    }

    function __ERC165NotSupported_init_unchained() internal __initializer {
    }
 }
