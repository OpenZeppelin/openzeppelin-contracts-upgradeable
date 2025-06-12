// SPDX-License-Identifier: MIT

pragma solidity ^0.8.27;

import {Account} from "@openzeppelin/contracts/account/Account.sol";
import {AccountERC7579Upgradeable} from "../../account/extensions/draft-AccountERC7579Upgradeable.sol";
import {AccountERC7579HookedUpgradeable} from "../../account/extensions/draft-AccountERC7579HookedUpgradeable.sol";
import {ERC721HolderUpgradeable} from "../../token/ERC721/utils/ERC721HolderUpgradeable.sol";
import {ERC1155HolderUpgradeable} from "../../token/ERC1155/utils/ERC1155HolderUpgradeable.sol";
import {ERC4337Utils} from "@openzeppelin/contracts/account/utils/draft-ERC4337Utils.sol";
import {ERC7739Upgradeable} from "../../utils/cryptography/signers/draft-ERC7739Upgradeable.sol";
import {ERC7821} from "@openzeppelin/contracts/account/extensions/ERC7821.sol";
import {MODULE_TYPE_VALIDATOR} from "@openzeppelin/contracts/interfaces/draft-IERC7579.sol";
import {PackedUserOperation} from "@openzeppelin/contracts/interfaces/draft-IERC4337.sol";
import {AbstractSigner} from "@openzeppelin/contracts/utils/cryptography/signers/AbstractSigner.sol";
import {SignerECDSAUpgradeable} from "../../utils/cryptography/signers/SignerECDSAUpgradeable.sol";
import {SignerP256Upgradeable} from "../../utils/cryptography/signers/SignerP256Upgradeable.sol";
import {SignerRSAUpgradeable} from "../../utils/cryptography/signers/SignerRSAUpgradeable.sol";
import {SignerERC7702} from "@openzeppelin/contracts/utils/cryptography/signers/SignerERC7702.sol";
import {SignerERC7913Upgradeable} from "../../utils/cryptography/signers/SignerERC7913Upgradeable.sol";
import {MultiSignerERC7913Upgradeable} from "../../utils/cryptography/signers/MultiSignerERC7913Upgradeable.sol";
import {Initializable} from "../../proxy/utils/Initializable.sol";

abstract contract AccountMockUpgradeable is Initializable, Account, ERC7739Upgradeable, ERC7821, ERC721HolderUpgradeable, ERC1155HolderUpgradeable {
    function __AccountMock_init() internal onlyInitializing {
    }

    function __AccountMock_init_unchained() internal onlyInitializing {
    }
    /// Validates a user operation with a boolean signature.
    function _rawSignatureValidation(bytes32 hash, bytes calldata signature) internal pure override returns (bool) {
        return signature.length >= 32 && bytes32(signature) == hash;
    }

    /// @inheritdoc ERC7821
    function _erc7821AuthorizedExecutor(
        address caller,
        bytes32 mode,
        bytes calldata executionData
    ) internal view virtual override returns (bool) {
        return caller == address(entryPoint()) || super._erc7821AuthorizedExecutor(caller, mode, executionData);
    }
}

abstract contract AccountECDSAMockUpgradeable is Initializable, Account, SignerECDSAUpgradeable, ERC7739Upgradeable, ERC7821, ERC721HolderUpgradeable, ERC1155HolderUpgradeable {
    function __AccountECDSAMock_init(address signerAddr) internal onlyInitializing {
        __AccountECDSAMock_init_unchained(signerAddr);
    }

    function __AccountECDSAMock_init_unchained(address signerAddr) internal onlyInitializing {
        _setSigner(signerAddr);
    }

    /// @inheritdoc ERC7821
    function _erc7821AuthorizedExecutor(
        address caller,
        bytes32 mode,
        bytes calldata executionData
    ) internal view virtual override returns (bool) {
        return caller == address(entryPoint()) || super._erc7821AuthorizedExecutor(caller, mode, executionData);
    }
}

abstract contract AccountP256MockUpgradeable is Initializable, Account, SignerP256Upgradeable, ERC7739Upgradeable, ERC7821, ERC721HolderUpgradeable, ERC1155HolderUpgradeable {
    function __AccountP256Mock_init(bytes32 qx, bytes32 qy) internal onlyInitializing {
        __AccountP256Mock_init_unchained(qx, qy);
    }

    function __AccountP256Mock_init_unchained(bytes32 qx, bytes32 qy) internal onlyInitializing {
        _setSigner(qx, qy);
    }

    /// @inheritdoc ERC7821
    function _erc7821AuthorizedExecutor(
        address caller,
        bytes32 mode,
        bytes calldata executionData
    ) internal view virtual override returns (bool) {
        return caller == address(entryPoint()) || super._erc7821AuthorizedExecutor(caller, mode, executionData);
    }
}

abstract contract AccountRSAMockUpgradeable is Initializable, Account, SignerRSAUpgradeable, ERC7739Upgradeable, ERC7821, ERC721HolderUpgradeable, ERC1155HolderUpgradeable {
    function __AccountRSAMock_init(bytes memory e, bytes memory n) internal onlyInitializing {
        __AccountRSAMock_init_unchained(e, n);
    }

    function __AccountRSAMock_init_unchained(bytes memory e, bytes memory n) internal onlyInitializing {
        _setSigner(e, n);
    }

    /// @inheritdoc ERC7821
    function _erc7821AuthorizedExecutor(
        address caller,
        bytes32 mode,
        bytes calldata executionData
    ) internal view virtual override returns (bool) {
        return caller == address(entryPoint()) || super._erc7821AuthorizedExecutor(caller, mode, executionData);
    }
}

abstract contract AccountERC7702MockUpgradeable is Initializable, Account, SignerERC7702, ERC7739Upgradeable, ERC7821, ERC721HolderUpgradeable, ERC1155HolderUpgradeable {
    function __AccountERC7702Mock_init() internal onlyInitializing {
    }

    function __AccountERC7702Mock_init_unchained() internal onlyInitializing {
    }
    /// @inheritdoc ERC7821
    function _erc7821AuthorizedExecutor(
        address caller,
        bytes32 mode,
        bytes calldata executionData
    ) internal view virtual override returns (bool) {
        return caller == address(entryPoint()) || super._erc7821AuthorizedExecutor(caller, mode, executionData);
    }
}

abstract contract AccountERC7702WithModulesMockUpgradeable is
    Initializable, Account,
    AccountERC7579Upgradeable,
    SignerERC7702,
    ERC7739Upgradeable,
    ERC721HolderUpgradeable,
    ERC1155HolderUpgradeable
{
    function __AccountERC7702WithModulesMock_init() internal onlyInitializing {
    }

    function __AccountERC7702WithModulesMock_init_unchained() internal onlyInitializing {
    }
    function _validateUserOp(
        PackedUserOperation calldata userOp,
        bytes32 userOpHash
    ) internal virtual override(Account, AccountERC7579Upgradeable) returns (uint256) {
        return super._validateUserOp(userOp, userOpHash);
    }

    /// @dev Resolve implementation of ERC-1271 by both ERC7739 and AccountERC7579 to support both schemes.
    function isValidSignature(
        bytes32 hash,
        bytes calldata signature
    ) public view virtual override(ERC7739Upgradeable, AccountERC7579Upgradeable) returns (bytes4) {
        // ERC-7739 can return the fn selector (success), 0xffffffff (invalid) or 0x77390001 (detection).
        // If the return is 0xffffffff, we fallback to validation using ERC-7579 modules.
        bytes4 erc7739magic = ERC7739Upgradeable.isValidSignature(hash, signature);
        return erc7739magic == bytes4(0xffffffff) ? AccountERC7579Upgradeable.isValidSignature(hash, signature) : erc7739magic;
    }

    /// @dev Enable signature using the ERC-7702 signer.
    function _rawSignatureValidation(
        bytes32 hash,
        bytes calldata signature
    ) internal view virtual override(AbstractSigner, AccountERC7579Upgradeable, SignerERC7702) returns (bool) {
        return SignerERC7702._rawSignatureValidation(hash, signature);
    }
}

abstract contract AccountERC7579MockUpgradeable is Initializable, AccountERC7579Upgradeable {
    function __AccountERC7579Mock_init(address validator, bytes memory initData) internal onlyInitializing {
        __AccountERC7579Mock_init_unchained(validator, initData);
    }

    function __AccountERC7579Mock_init_unchained(address validator, bytes memory initData) internal onlyInitializing {
        _installModule(MODULE_TYPE_VALIDATOR, validator, initData);
    }
}

abstract contract AccountERC7579HookedMockUpgradeable is Initializable, AccountERC7579HookedUpgradeable {
    function __AccountERC7579HookedMock_init(address validator, bytes memory initData) internal onlyInitializing {
        __AccountERC7579HookedMock_init_unchained(validator, initData);
    }

    function __AccountERC7579HookedMock_init_unchained(address validator, bytes memory initData) internal onlyInitializing {
        _installModule(MODULE_TYPE_VALIDATOR, validator, initData);
    }
}

abstract contract AccountMultiSignerMockUpgradeable is Initializable, Account, MultiSignerERC7913Upgradeable, ERC7739Upgradeable, ERC7821, ERC721HolderUpgradeable, ERC1155HolderUpgradeable {
    function __AccountMultiSignerMock_init(bytes[] memory signers, uint64 threshold) internal onlyInitializing {
        __AccountMultiSignerMock_init_unchained(signers, threshold);
    }

    function __AccountMultiSignerMock_init_unchained(bytes[] memory signers, uint64 threshold) internal onlyInitializing {
        _addSigners(signers);
        _setThreshold(threshold);
    }

    /// @inheritdoc ERC7821
    function _erc7821AuthorizedExecutor(
        address caller,
        bytes32 mode,
        bytes calldata executionData
    ) internal view virtual override returns (bool) {
        return caller == address(entryPoint()) || super._erc7821AuthorizedExecutor(caller, mode, executionData);
    }
}

abstract contract AccountERC7913MockUpgradeable is Initializable, Account, SignerERC7913Upgradeable, ERC7739Upgradeable, ERC7821, ERC721HolderUpgradeable, ERC1155HolderUpgradeable {
    function __AccountERC7913Mock_init(bytes memory _signer) internal onlyInitializing {
        __AccountERC7913Mock_init_unchained(_signer);
    }

    function __AccountERC7913Mock_init_unchained(bytes memory _signer) internal onlyInitializing {
        _setSigner(_signer);
    }

    /// @inheritdoc ERC7821
    function _erc7821AuthorizedExecutor(
        address caller,
        bytes32 mode,
        bytes calldata executionData
    ) internal view virtual override returns (bool) {
        return caller == address(entryPoint()) || super._erc7821AuthorizedExecutor(caller, mode, executionData);
    }
}
