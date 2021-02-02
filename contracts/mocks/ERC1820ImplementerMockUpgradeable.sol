// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

import "../introspection/ERC1820ImplementerUpgradeable.sol";
import "../proxy/Initializable.sol";

contract ERC1820ImplementerMockUpgradeable is Initializable, ERC1820ImplementerUpgradeable {
    function __ERC1820ImplementerMock_init() internal initializer {
        __ERC1820Implementer_init_unchained();
        __ERC1820ImplementerMock_init_unchained();
    }

    function __ERC1820ImplementerMock_init_unchained() internal initializer {
    }
    function registerInterfaceForAddress(bytes32 interfaceHash, address account) public {
        _registerInterfaceForAddress(interfaceHash, account);
    }
    uint256[50] private __gap;
}
