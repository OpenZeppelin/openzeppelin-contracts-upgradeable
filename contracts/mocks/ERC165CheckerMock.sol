// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../introspection/ERC165Checker.sol";
import "../Initializable.sol";

contract ERC165CheckerMockUpgradeSafe is Initializable {
    constructor() public  {
        __ERC165CheckerMock_init();
    }

    function __ERC165CheckerMock_init() internal initializer {
        __ERC165CheckerMock_init_unchained();
    }

    function __ERC165CheckerMock_init_unchained() internal initializer {


    }

    using ERC165Checker for address;

    function supportsERC165(address account) public view returns (bool) {
        return account.supportsERC165();
    }

    function supportsInterface(address account, bytes4 interfaceId) public view returns (bool) {
        return account.supportsInterface(interfaceId);
    }

    function supportsAllInterfaces(address account, bytes4[] memory interfaceIds) public view returns (bool) {
        return account.supportsAllInterfaces(interfaceIds);
    }

    uint256[50] private __gap;
}
