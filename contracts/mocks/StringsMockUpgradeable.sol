// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

import "../utils/StringsUpgradeable.sol";
import "../proxy/Initializable.sol";

contract StringsMockUpgradeable is Initializable {
    function __StringsMock_init() internal initializer {
        __StringsMock_init_unchained();
    }

    function __StringsMock_init_unchained() internal initializer {
    }
    function fromUint256(uint256 value) public pure returns (string memory) {
        return StringsUpgradeable.toString(value);
    }
    uint256[50] private __gap;
}
