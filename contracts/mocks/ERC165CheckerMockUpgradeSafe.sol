// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../introspection/ERC165CheckerUpgradeSafe.sol";
import "../Initializable.sol";

contract ERC165CheckerMockUpgradeSafe is __Initializable {
    function __ERC165CheckerMock_init() internal __initializer {
        __ERC165CheckerMock_init_unchained();
    }

    function __ERC165CheckerMock_init_unchained() internal __initializer {
    }
    using ERC165CheckerUpgradeSafe for address;

    function supportsERC165(address account) public view returns (bool) {
        return account.supportsERC165();
    }

    function supportsInterface(address account, bytes4 interfaceId) public view returns (bool) {
        return account.supportsInterface(interfaceId);
    }

    function supportsAllInterfaces(address account, bytes4[] memory interfaceIds) public view returns (bool) {
        return account.supportsAllInterfaces(interfaceIds);
    }
}
