// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {ERC20VotesUpgradeable} from "../../token/ERC20/extensions/ERC20VotesUpgradeable.sol";
import {VotesExtendedUpgradeable, VotesUpgradeable} from "../../governance/utils/VotesExtendedUpgradeable.sol";
import {SafeCast} from "@openzeppelin/contracts/utils/math/SafeCast.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

abstract contract ERC20VotesExtendedMockUpgradeable is Initializable, ERC20VotesUpgradeable, VotesExtendedUpgradeable {
    function __ERC20VotesExtendedMock_init() internal onlyInitializing {
    }

    function __ERC20VotesExtendedMock_init_unchained() internal onlyInitializing {
    }
    function _delegate(address account, address delegatee) internal virtual override(VotesUpgradeable, VotesExtendedUpgradeable) {
        return super._delegate(account, delegatee);
    }

    function _transferVotingUnits(
        address from,
        address to,
        uint256 amount
    ) internal virtual override(VotesUpgradeable, VotesExtendedUpgradeable) {
        return super._transferVotingUnits(from, to, amount);
    }
}

abstract contract ERC20VotesExtendedTimestampMockUpgradeable is Initializable, ERC20VotesExtendedMockUpgradeable {
    function __ERC20VotesExtendedTimestampMock_init() internal onlyInitializing {
    }

    function __ERC20VotesExtendedTimestampMock_init_unchained() internal onlyInitializing {
    }
    function clock() public view virtual override returns (uint48) {
        return SafeCast.toUint48(block.timestamp);
    }

    // solhint-disable-next-line func-name-mixedcase
    function CLOCK_MODE() public view virtual override returns (string memory) {
        return "mode=timestamp";
    }
}
