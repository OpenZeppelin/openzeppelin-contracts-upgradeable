// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../utils/StringsUpgradeSafe.sol";
import "../Initializable.sol";

contract StringsMockUpgradeSafe is __Initializable {
    function __StringsMock_init() internal __initializer {
        __StringsMock_init_unchained();
    }

    function __StringsMock_init_unchained() internal __initializer {
    }
    function fromUint256(uint256 value) public pure returns (string memory) {
        return StringsUpgradeSafe.toString(value);
    }
    uint256[50] private __gap;
}
