// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../GSN/ContextUpgradeSafe.sol";
import "../token/ERC777/ERC777UpgradeSafe.sol";
import "../Initializable.sol";

contract ERC777MockUpgradeSafe is __Initializable, ContextUpgradeSafe, ERC777UpgradeSafe {
    function __ERC777Mock_init(
        address initialHolder,
        uint256 initialBalance,
        string memory name,
        string memory symbol,
        address[] memory defaultOperators
    ) internal __initializer {
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
    ) internal __initializer {
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
}
