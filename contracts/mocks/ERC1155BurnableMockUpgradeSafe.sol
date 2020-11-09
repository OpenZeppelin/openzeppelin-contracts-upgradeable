// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../token/ERC1155/ERC1155BurnableUpgradeSafe.sol";
import "../Initializable.sol";

contract ERC1155BurnableMockUpgradeSafe is __Initializable, ERC1155BurnableUpgradeSafe {
    function __ERC1155BurnableMock_init(string memory uri) internal __initializer {
        __Context_init_unchained();
        __ERC165_init_unchained();
        __ERC1155_init_unchained(uri);
        __ERC1155Burnable_init_unchained();
        __ERC1155BurnableMock_init_unchained(uri);
    }

    function __ERC1155BurnableMock_init_unchained(string memory uri) internal __initializer { }

    function mint(address to, uint256 id, uint256 value, bytes memory data) public {
        _mint(to, id, value, data);
    }
    uint256[50] private __gap;
}
