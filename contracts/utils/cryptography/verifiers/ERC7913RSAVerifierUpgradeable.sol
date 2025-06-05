// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {RSA} from "@openzeppelin/contracts/utils/cryptography/RSA.sol";
import {IERC7913SignatureVerifier} from "@openzeppelin/contracts/interfaces/IERC7913.sol";
import {Initializable} from "../../../proxy/utils/Initializable.sol";

/**
 * @dev ERC-7913 signature verifier that support RSA keys.
 */
contract ERC7913RSAVerifierUpgradeable is Initializable, IERC7913SignatureVerifier {
    function __ERC7913RSAVerifier_init() internal onlyInitializing {
    }

    function __ERC7913RSAVerifier_init_unchained() internal onlyInitializing {
    }
    /// @inheritdoc IERC7913SignatureVerifier
    function verify(bytes calldata key, bytes32 hash, bytes calldata signature) public view virtual returns (bytes4) {
        (bytes memory e, bytes memory n) = abi.decode(key, (bytes, bytes));
        return
            RSA.pkcs1Sha256(abi.encodePacked(hash), signature, e, n)
                ? IERC7913SignatureVerifier.verify.selector
                : bytes4(0xFFFFFFFF);
    }
}
