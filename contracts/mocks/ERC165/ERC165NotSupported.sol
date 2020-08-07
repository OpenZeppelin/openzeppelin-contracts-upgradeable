// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;
import "../../Initializable.sol";

contract ERC165NotSupportedUpgradeSafe is Initializable {
    constructor() public  {
        __ERC165NotSupported_init();
    }

    function __ERC165NotSupported_init() internal initializer {
        __ERC165NotSupported_init_unchained();
    }

    function __ERC165NotSupported_init_unchained() internal initializer {


    }

    uint256[50] private __gap;
}
