// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {MODULE_TYPE_HOOK, MODULE_TYPE_FALLBACK, MODULE_TYPE_VALIDATOR, IERC7579Hook, IERC7579Module, IERC7579Validator} from "@openzeppelin/contracts/interfaces/draft-IERC7579.sol";
import {SignatureChecker} from "@openzeppelin/contracts/utils/cryptography/SignatureChecker.sol";
import {PackedUserOperation} from "@openzeppelin/contracts/interfaces/draft-IERC4337.sol";
import {IERC1271} from "@openzeppelin/contracts/interfaces/IERC1271.sol";
import {ERC4337Utils} from "@openzeppelin/contracts/account/utils/draft-ERC4337Utils.sol";
import {Initializable} from "../../../proxy/utils/Initializable.sol";

abstract contract ERC7579ModuleMockUpgradeable is Initializable, IERC7579Module {
    uint256 private _moduleTypeId;

    event ModuleInstalledReceived(address account, bytes data);
    event ModuleUninstalledReceived(address account, bytes data);

    function __ERC7579ModuleMock_init(uint256 moduleTypeId) internal onlyInitializing {
        __ERC7579ModuleMock_init_unchained(moduleTypeId);
    }

    function __ERC7579ModuleMock_init_unchained(uint256 moduleTypeId) internal onlyInitializing {
        _moduleTypeId = moduleTypeId;
    }

    function onInstall(bytes calldata data) public virtual {
        emit ModuleInstalledReceived(msg.sender, data);
    }

    function onUninstall(bytes calldata data) public virtual {
        emit ModuleUninstalledReceived(msg.sender, data);
    }

    function isModuleType(uint256 moduleTypeId) external view returns (bool) {
        return moduleTypeId == _moduleTypeId;
    }
}

abstract contract ERC7579HookMockUpgradeable is Initializable, ERC7579ModuleMockUpgradeable, IERC7579Hook {
    event PreCheck(address sender, uint256 value, bytes data);
    event PostCheck(bytes hookData);

    function __ERC7579HookMock_init() internal onlyInitializing {
        __ERC7579ModuleMock_init_unchained(MODULE_TYPE_HOOK);
    }

    function __ERC7579HookMock_init_unchained() internal onlyInitializing {
    }
    function preCheck(
        address msgSender,
        uint256 value,
        bytes calldata msgData
    ) external returns (bytes memory hookData) {
        emit PreCheck(msgSender, value, msgData);
        return msgData;
    }

    function postCheck(bytes calldata hookData) external {
        emit PostCheck(hookData);
    }
}

abstract contract ERC7579FallbackHandlerMockUpgradeable is Initializable, ERC7579ModuleMockUpgradeable {
    event ERC7579FallbackHandlerMockCalled(address account, address sender, uint256 value, bytes data);

    error ERC7579FallbackHandlerMockRevert();

    function __ERC7579FallbackHandlerMock_init() internal onlyInitializing {
        __ERC7579ModuleMock_init_unchained(MODULE_TYPE_FALLBACK);
    }

    function __ERC7579FallbackHandlerMock_init_unchained() internal onlyInitializing {
    }
    function _msgAccount() internal view returns (address) {
        return msg.sender;
    }

    function _msgSender() internal pure returns (address) {
        return address(bytes20(msg.data[msg.data.length - 20:]));
    }

    function _msgData() internal pure returns (bytes calldata) {
        return msg.data[:msg.data.length - 20];
    }

    function callPayable() public payable {
        emit ERC7579FallbackHandlerMockCalled(_msgAccount(), _msgSender(), msg.value, _msgData());
    }

    function callView() public view returns (address, address) {
        return (_msgAccount(), _msgSender());
    }

    function callRevert() public pure {
        revert ERC7579FallbackHandlerMockRevert();
    }
}

abstract contract ERC7579ValidatorMockUpgradeable is Initializable, ERC7579ModuleMockUpgradeable, IERC7579Validator {
    mapping(address sender => address signer) private _associatedSigners;

    function __ERC7579ValidatorMock_init() internal onlyInitializing {
        __ERC7579ModuleMock_init_unchained(MODULE_TYPE_VALIDATOR);
    }

    function __ERC7579ValidatorMock_init_unchained() internal onlyInitializing {
    }
    function onInstall(bytes calldata data) public virtual override(IERC7579Module, ERC7579ModuleMockUpgradeable) {
        _associatedSigners[msg.sender] = address(bytes20(data[0:20]));
        super.onInstall(data);
    }

    function onUninstall(bytes calldata data) public virtual override(IERC7579Module, ERC7579ModuleMockUpgradeable) {
        delete _associatedSigners[msg.sender];
        super.onUninstall(data);
    }

    function validateUserOp(
        PackedUserOperation calldata userOp,
        bytes32 userOpHash
    ) public view virtual returns (uint256) {
        return
            SignatureChecker.isValidSignatureNow(_associatedSigners[msg.sender], userOpHash, userOp.signature)
                ? ERC4337Utils.SIG_VALIDATION_SUCCESS
                : ERC4337Utils.SIG_VALIDATION_FAILED;
    }

    function isValidSignatureWithSender(
        address /*sender*/,
        bytes32 hash,
        bytes calldata signature
    ) public view virtual returns (bytes4) {
        return
            SignatureChecker.isValidSignatureNow(_associatedSigners[msg.sender], hash, signature)
                ? IERC1271.isValidSignature.selector
                : bytes4(0xffffffff);
    }
}
