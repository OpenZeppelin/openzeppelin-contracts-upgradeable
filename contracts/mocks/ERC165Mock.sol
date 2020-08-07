// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../introspection/ERC165.sol";
import "../Initializable.sol";

contract ERC165MockUpgradeSafe is Initializable, ERC165UpgradeSafe {
    constructor() public  {
        __ERC165Mock_init();
    }

    function __ERC165Mock_init() internal initializer {
        __ERC165_init_unchained();
        __ERC165Mock_init_unchained();
    }

    function __ERC165Mock_init_unchained() internal initializer {


    }

    function registerInterface(bytes4 interfaceId) public {
        _registerInterface(interfaceId);
    }

    uint256[50] private __gap;
}
