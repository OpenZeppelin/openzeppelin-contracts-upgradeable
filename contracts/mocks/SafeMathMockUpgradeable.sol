// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../math/SafeMathUpgradeable.sol";
import "../proxy/Initializable.sol";

contract SafeMathMockUpgradeable is Initializable {
    function __SafeMathMock_init() internal initializer {
        __SafeMathMock_init_unchained();
    }

    function __SafeMathMock_init_unchained() internal initializer {
    }
    function mul(uint256 a, uint256 b) public pure returns (uint256) {
        return SafeMathUpgradeable.mul(a, b);
    }

    function div(uint256 a, uint256 b) public pure returns (uint256) {
        return SafeMathUpgradeable.div(a, b);
    }

    function sub(uint256 a, uint256 b) public pure returns (uint256) {
        return SafeMathUpgradeable.sub(a, b);
    }

    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return SafeMathUpgradeable.add(a, b);
    }

    function mod(uint256 a, uint256 b) public pure returns (uint256) {
        return SafeMathUpgradeable.mod(a, b);
    }
    uint256[50] private __gap;
}
