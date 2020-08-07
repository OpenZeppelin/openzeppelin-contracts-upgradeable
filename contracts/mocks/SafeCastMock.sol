// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../utils/SafeCast.sol";
import "../Initializable.sol";

contract SafeCastMockUpgradeSafe is Initializable {
    constructor() public  {
        __SafeCastMock_init();
    }

    function __SafeCastMock_init() internal initializer {
        __SafeCastMock_init_unchained();
    }

    function __SafeCastMock_init_unchained() internal initializer {


    }

    using SafeCast for uint;
    using SafeCast for int;

    function toUint256(int a) public pure returns (uint256) {
        return a.toUint256();
    }

    function toInt256(uint a) public pure returns (int256) {
        return a.toInt256();
    }

    function toUint128(uint a) public pure returns (uint128) {
        return a.toUint128();
    }

    function toUint64(uint a) public pure returns (uint64) {
        return a.toUint64();
    }

    function toUint32(uint a) public pure returns (uint32) {
        return a.toUint32();
    }

    function toUint16(uint a) public pure returns (uint16) {
        return a.toUint16();
    }

    function toUint8(uint a) public pure returns (uint8) {
        return a.toUint8();
    }

    uint256[50] private __gap;
}
