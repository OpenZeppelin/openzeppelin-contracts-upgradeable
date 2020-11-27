// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;
import "../../proxy/Initializable.sol";

contract ERC165NotSupportedUpgradeable is Initializable {    function __ERC165NotSupported_init() internal initializer {
        __ERC165NotSupported_init_unchained();
    }

    function __ERC165NotSupported_init_unchained() internal initializer {
    }
     uint256[50] private __gap;
}
