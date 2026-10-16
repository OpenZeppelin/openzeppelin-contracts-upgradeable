// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {UUPSUpgradeable} from "@openzeppelin/contracts/proxy/utils/UUPSUpgradeable.sol";
import {ERC20Upgradeable} from "../../token/ERC20/ERC20Upgradeable.sol";
import {ERC20VotesUpgradeable} from "../../token/ERC20/extensions/ERC20VotesUpgradeable.sol";

contract ERC20WithoutVotes is ERC20Upgradeable, UUPSUpgradeable {
    function initialize(string memory name_, string memory symbol_) public initializer {
        __ERC20_init(name_, symbol_);
    }

    function _authorizeUpgrade(address newImplementation) internal virtual override {}
}

contract ERC20WithVotes is ERC20WithoutVotes, ERC20VotesUpgradeable {
    function initializeV2(string memory name_, string memory version_) public reinitializer(2) {
        __EIP712_init(name_, version_);
    }

    function _update(
        address from,
        address to,
        uint256 value
    ) internal virtual override(ERC20Upgradeable, ERC20VotesUpgradeable) {
        super._update(from, to, value);
    }
}
