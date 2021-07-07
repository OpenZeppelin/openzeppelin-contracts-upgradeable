// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ContextMockUpgradeable.sol";
import "../metatx/ERC2771ContextUpgradeable.sol";
import "../proxy/utils/Initializable.sol";

// By inheriting from ERC2771Context, Context's internal functions are overridden automatically
contract ERC2771ContextMockUpgradeable is Initializable, ContextMockUpgradeable, ERC2771ContextUpgradeable {
    function __ERC2771ContextMock_init(address trustedForwarder) internal initializer {
        __Context_init_unchained();
        __ContextMock_init_unchained();
        __ERC2771Context_init_unchained(trustedForwarder);
        __ERC2771ContextMock_init_unchained(trustedForwarder);
    }

    function __ERC2771ContextMock_init_unchained(address trustedForwarder) internal initializer {}

    function _msgSender() internal view virtual override(ContextUpgradeable, ERC2771ContextUpgradeable) returns (address) {
        return ERC2771ContextUpgradeable._msgSender();
    }

    function _msgData() internal view virtual override(ContextUpgradeable, ERC2771ContextUpgradeable) returns (bytes calldata) {
        return ERC2771ContextUpgradeable._msgData();
    }
    uint256[50] private __gap;
}
