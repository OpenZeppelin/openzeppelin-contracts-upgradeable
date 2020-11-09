// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../math/MathUpgradeSafe.sol";
import "../Initializable.sol";

contract MathMockUpgradeSafe is __Initializable {
    function __MathMock_init() internal __initializer {
        __MathMock_init_unchained();
    }

    function __MathMock_init_unchained() internal __initializer {
    }
    function max(uint256 a, uint256 b) public pure returns (uint256) {
        return MathUpgradeSafe.max(a, b);
    }

    function min(uint256 a, uint256 b) public pure returns (uint256) {
        return MathUpgradeSafe.min(a, b);
    }

    function average(uint256 a, uint256 b) public pure returns (uint256) {
        return MathUpgradeSafe.average(a, b);
    }
    uint256[50] private __gap;
}
