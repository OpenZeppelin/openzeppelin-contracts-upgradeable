// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../introspection/ERC1820ImplementerUpgradeSafe.sol";
import "../Initializable.sol";

contract ERC1820ImplementerMockUpgradeSafe is __Initializable, ERC1820ImplementerUpgradeSafe {
    function __ERC1820ImplementerMock_init() internal __initializer {
        __ERC1820Implementer_init_unchained();
        __ERC1820ImplementerMock_init_unchained();
    }

    function __ERC1820ImplementerMock_init_unchained() internal __initializer {
    }
    function registerInterfaceForAddress(bytes32 interfaceHash, address account) public {
        _registerInterfaceForAddress(interfaceHash, account);
    }
}
