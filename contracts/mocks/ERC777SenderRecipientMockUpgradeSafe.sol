// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../GSN/ContextUpgradeSafe.sol";
import "../token/ERC777/IERC777UpgradeSafe.sol";
import "../token/ERC777/IERC777SenderUpgradeSafe.sol";
import "../token/ERC777/IERC777RecipientUpgradeSafe.sol";
import "../introspection/IERC1820RegistryUpgradeSafe.sol";
import "../introspection/ERC1820ImplementerUpgradeSafe.sol";
import "../Initializable.sol";

contract ERC777SenderRecipientMockUpgradeSafe is __Initializable, ContextUpgradeSafe, IERC777SenderUpgradeSafe, IERC777RecipientUpgradeSafe, ERC1820ImplementerUpgradeSafe {
    function __ERC777SenderRecipientMock_init() internal __initializer {
        __Context_init_unchained();
        __ERC1820Implementer_init_unchained();
        __ERC777SenderRecipientMock_init_unchained();
    }

    function __ERC777SenderRecipientMock_init_unchained() internal __initializer {
        _erc1820 = IERC1820RegistryUpgradeSafe(0x1820a4B7618BdE71Dce8cdc73aAB6C95905faD24);
    }
    event TokensToSendCalled(
        address operator,
        address from,
        address to,
        uint256 amount,
        bytes data,
        bytes operatorData,
        address token,
        uint256 fromBalance,
        uint256 toBalance
    );

    event TokensReceivedCalled(
        address operator,
        address from,
        address to,
        uint256 amount,
        bytes data,
        bytes operatorData,
        address token,
        uint256 fromBalance,
        uint256 toBalance
    );

    bool private _shouldRevertSend;
    bool private _shouldRevertReceive;

    IERC1820RegistryUpgradeSafe private _erc1820;

    bytes32 constant private _TOKENS_SENDER_INTERFACE_HASH = keccak256("ERC777TokensSender");
    bytes32 constant private _TOKENS_RECIPIENT_INTERFACE_HASH = keccak256("ERC777TokensRecipient");

    function tokensToSend(
        address operator,
        address from,
        address to,
        uint256 amount,
        bytes calldata userData,
        bytes calldata operatorData
    ) external override {
        if (_shouldRevertSend) {
            revert();
        }

        IERC777UpgradeSafe token = IERC777UpgradeSafe(_msgSender());

        uint256 fromBalance = token.balanceOf(from);
        // when called due to burn, to will be the zero address, which will have a balance of 0
        uint256 toBalance = token.balanceOf(to);

        emit TokensToSendCalled(
            operator,
            from,
            to,
            amount,
            userData,
            operatorData,
            address(token),
            fromBalance,
            toBalance
        );
    }

    function tokensReceived(
        address operator,
        address from,
        address to,
        uint256 amount,
        bytes calldata userData,
        bytes calldata operatorData
    ) external override {
        if (_shouldRevertReceive) {
            revert();
        }

        IERC777UpgradeSafe token = IERC777UpgradeSafe(_msgSender());

        uint256 fromBalance = token.balanceOf(from);
        // when called due to burn, to will be the zero address, which will have a balance of 0
        uint256 toBalance = token.balanceOf(to);

        emit TokensReceivedCalled(
            operator,
            from,
            to,
            amount,
            userData,
            operatorData,
            address(token),
            fromBalance,
            toBalance
        );
    }

    function senderFor(address account) public {
        _registerInterfaceForAddress(_TOKENS_SENDER_INTERFACE_HASH, account);

        address self = address(this);
        if (account == self) {
            registerSender(self);
        }
    }

    function registerSender(address sender) public {
        _erc1820.setInterfaceImplementer(address(this), _TOKENS_SENDER_INTERFACE_HASH, sender);
    }

    function recipientFor(address account) public {
        _registerInterfaceForAddress(_TOKENS_RECIPIENT_INTERFACE_HASH, account);

        address self = address(this);
        if (account == self) {
            registerRecipient(self);
        }
    }

    function registerRecipient(address recipient) public {
        _erc1820.setInterfaceImplementer(address(this), _TOKENS_RECIPIENT_INTERFACE_HASH, recipient);
    }

    function setShouldRevertSend(bool shouldRevert) public {
        _shouldRevertSend = shouldRevert;
    }

    function setShouldRevertReceive(bool shouldRevert) public {
        _shouldRevertReceive = shouldRevert;
    }

    function send(IERC777UpgradeSafe token, address to, uint256 amount, bytes memory data) public {
        // This is 777's send function, not the Solidity send function
        token.send(to, amount, data); // solhint-disable-line check-send-result
    }

    function burn(IERC777UpgradeSafe token, uint256 amount, bytes memory data) public {
        token.burn(amount, data);
    }
}

