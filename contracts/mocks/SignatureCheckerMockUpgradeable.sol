// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../utils/cryptography/SignatureCheckerUpgradeable.sol";
import "../proxy/utils/Initializable.sol";

contract SignatureCheckerMockUpgradeable is Initializable {
    function __SignatureCheckerMock_init() internal initializer {
        __SignatureCheckerMock_init_unchained();
    }

    function __SignatureCheckerMock_init_unchained() internal initializer {
    }
    using SignatureCheckerUpgradeable for address;

    function isValidSignatureNow(
        address signer,
        bytes32 hash,
        bytes memory signature
    ) public view returns (bool) {
        return signer.isValidSignatureNow(hash, signature);
    }
    uint256[50] private __gap;
}
