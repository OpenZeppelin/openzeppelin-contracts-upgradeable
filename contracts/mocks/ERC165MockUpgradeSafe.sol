// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../introspection/ERC165UpgradeSafe.sol";
import "../Initializable.sol";

contract ERC165MockUpgradeSafe is __Initializable, ERC165UpgradeSafe {
    function __ERC165Mock_init() internal __initializer {
        __ERC165_init_unchained();
        __ERC165Mock_init_unchained();
    }

    function __ERC165Mock_init_unchained() internal __initializer {
    }
    function registerInterface(bytes4 interfaceId) public {
        _registerInterface(interfaceId);
    }
}
