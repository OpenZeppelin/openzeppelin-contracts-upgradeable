// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../math/SignedSafeMathUpgradeSafe.sol";
import "../Initializable.sol";

contract SignedSafeMathMockUpgradeSafe is __Initializable {
    function __SignedSafeMathMock_init() internal __initializer {
        __SignedSafeMathMock_init_unchained();
    }

    function __SignedSafeMathMock_init_unchained() internal __initializer {
    }
    function mul(int256 a, int256 b) public pure returns (int256) {
        return SignedSafeMathUpgradeSafe.mul(a, b);
    }

    function div(int256 a, int256 b) public pure returns (int256) {
        return SignedSafeMathUpgradeSafe.div(a, b);
    }

    function sub(int256 a, int256 b) public pure returns (int256) {
        return SignedSafeMathUpgradeSafe.sub(a, b);
    }

    function add(int256 a, int256 b) public pure returns (int256) {
        return SignedSafeMathUpgradeSafe.add(a, b);
    }
}
