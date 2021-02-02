// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

import "../utils/ContextUpgradeable.sol";
import "../token/ERC777/ERC777Upgradeable.sol";
import "../proxy/Initializable.sol";

contract ERC777MockUpgradeable is Initializable, ContextUpgradeable, ERC777Upgradeable {
    event BeforeTokenTransfer();

    function __ERC777Mock_init(
        address initialHolder,
        uint256 initialBalance,
        string memory name,
        string memory symbol,
        address[] memory defaultOperators
    ) internal initializer {
        __Context_init_unchained();
        __ERC777_init_unchained(name, symbol, defaultOperators);
        __ERC777Mock_init_unchained(initialHolder, initialBalance, name, symbol, defaultOperators);
    }

    function __ERC777Mock_init_unchained(
        address initialHolder,
        uint256 initialBalance,
        string memory name,
        string memory symbol,
        address[] memory defaultOperators
    ) internal initializer {
        _mint(initialHolder, initialBalance, "", "");
    }

    function mintInternal (
        address to,
        uint256 amount,
        bytes memory userData,
        bytes memory operatorData
    ) public {
        _mint(to, amount, userData, operatorData);
    }

    function approveInternal(address holder, address spender, uint256 value) public {
        _approve(holder, spender, value);
    }

    function _beforeTokenTransfer(address, address, address, uint256) internal override {
        emit BeforeTokenTransfer();
    }
    uint256[50] private __gap;
}
