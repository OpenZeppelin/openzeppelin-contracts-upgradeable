// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import '../payment/escrow/Escrow.sol';
import "../Initializable.sol";

contract EscrowMockUpgradeSafe is Initializable, EscrowUpgradeSafe {
    constructor() public  {
        __EscrowMock_init();
    }

    function __EscrowMock_init() internal initializer {
        __Context_init_unchained();
        __Ownable_init_unchained();
        __Escrow_init_unchained();
        __EscrowMock_init_unchained();
    }

    function __EscrowMock_init_unchained() internal initializer {


    }


    uint256[50] private __gap;
}
