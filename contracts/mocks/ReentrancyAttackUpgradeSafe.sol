// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../GSN/ContextUpgradeSafe.sol";
import "../proxy/Initializable.sol";
contract ReentrancyAttackUpgradeSafe is Initializable, ContextUpgradeSafe {
    function __ReentrancyAttack_init() internal initializer {
        __Context_init_unchained();
        __ReentrancyAttack_init_unchained();
    }

    function __ReentrancyAttack_init_unchained() internal initializer {
    }
    function callSender(bytes4 data) public {
        // solhint-disable-next-line avoid-low-level-calls
        (bool success,) = _msgSender().call(abi.encodeWithSelector(data));
        require(success, "ReentrancyAttack: failed call");
    }
    uint256[50] private __gap;
}
