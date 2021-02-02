// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

import "../utils/ContextUpgradeable.sol";
import "../proxy/Initializable.sol";
contract ReentrancyAttackUpgradeable is Initializable, ContextUpgradeable {
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
