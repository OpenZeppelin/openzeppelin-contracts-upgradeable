// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../token/ERC1155/ERC1155Holder.sol";
import "../Initializable.sol";

contract ERC1155HolderMockUpgradeSafe is Initializable, ERC1155HolderUpgradeSafe {
    
    constructor() public  {
        __ERC1155HolderMock_init();
    }

    function __ERC1155HolderMock_init() internal initializer {
        __ERC165_init_unchained();
        __ERC1155Receiver_init_unchained();
        __ERC1155Holder_init_unchained();
        __ERC1155HolderMock_init_unchained();
    }

    function __ERC1155HolderMock_init_unchained() internal initializer {
        
         
    }


    uint256[50] private __gap;
}
