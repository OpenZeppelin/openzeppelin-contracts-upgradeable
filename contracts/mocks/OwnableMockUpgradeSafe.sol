// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../access/OwnableUpgradeSafe.sol";
import "../Initializable.sol";

contract OwnableMockUpgradeSafe is __Initializable, OwnableUpgradeSafe {    function __OwnableMock_init() internal __initializer {
        __Context_init_unchained();
        __Ownable_init_unchained();
        __OwnableMock_init_unchained();
    }

    function __OwnableMock_init_unchained() internal __initializer {
    }
 }
