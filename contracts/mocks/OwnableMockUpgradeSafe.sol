// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../access/OwnableUpgradeSafe.sol";
import "../proxy/Initializable.sol";

contract OwnableMockUpgradeSafe is Initializable, OwnableUpgradeSafe {    function __OwnableMock_init() internal initializer {
        __Context_init_unchained();
        __Ownable_init_unchained();
        __OwnableMock_init_unchained();
    }

    function __OwnableMock_init_unchained() internal initializer {
    }
     uint256[50] private __gap;
}
