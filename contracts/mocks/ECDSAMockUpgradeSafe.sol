// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../cryptography/ECDSAUpgradeSafe.sol";
import "../proxy/Initializable.sol";

contract ECDSAMockUpgradeSafe is Initializable {
    function __ECDSAMock_init() internal initializer {
        __ECDSAMock_init_unchained();
    }

    function __ECDSAMock_init_unchained() internal initializer {
    }
    using ECDSAUpgradeSafe for bytes32;

    function recover(bytes32 hash, bytes memory signature) public pure returns (address) {
        return hash.recover(signature);
    }

    function toEthSignedMessageHash(bytes32 hash) public pure returns (bytes32) {
        return hash.toEthSignedMessageHash();
    }
    uint256[50] private __gap;
}
