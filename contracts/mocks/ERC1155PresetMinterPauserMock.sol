// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../presets/ERC1155PresetMinterPauser.sol";
import "../Initializable.sol";

contract ERC1155PresetMinterPauserMockUpgradeSafe is Initializable, ERC1155PresetMinterPauserUpgradeSafe {
  
    constructor(string memory uri) public  {
        __ERC1155PresetMinterPauserMock_init(uri);
    }

    function __ERC1155PresetMinterPauserMock_init(string memory uri) internal initializer {
        __Context_init_unchained();
        __AccessControl_init_unchained();
        __ERC165_init_unchained();
        __ERC1155_init_unchained(uri);
        __ERC1155Burnable_init_unchained();
        __Pausable_init_unchained();
        __ERC1155Pausable_init_unchained();
        __ERC1155PresetMinterPauser_init_unchained(uri);
        __ERC1155PresetMinterPauserMock_init_unchained(uri);
    }

    function __ERC1155PresetMinterPauserMock_init_unchained(string memory uri) internal initializer {
        
        
  
    }


    uint256[50] private __gap;
}
