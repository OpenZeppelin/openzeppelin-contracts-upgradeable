// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {VotesExtendedUpgradeable} from "../governance/utils/VotesExtendedUpgradeable.sol";
import {Initializable} from "../proxy/utils/Initializable.sol";

abstract contract VotesExtendedMockUpgradeable is Initializable, VotesExtendedUpgradeable {
    mapping(address voter => uint256) private _votingUnits;

    function __VotesExtendedMock_init() internal onlyInitializing {
    }

    function __VotesExtendedMock_init_unchained() internal onlyInitializing {
    }
    function getTotalSupply() public view returns (uint256) {
        return _getTotalSupply();
    }

    function delegate(address account, address newDelegation) public {
        return _delegate(account, newDelegation);
    }

    function _getVotingUnits(address account) internal view override returns (uint256) {
        return _votingUnits[account];
    }

    function _mint(address account, uint256 votes) internal {
        _votingUnits[account] += votes;
        _transferVotingUnits(address(0), account, votes);
    }

    function _burn(address account, uint256 votes) internal {
        _votingUnits[account] += votes;
        _transferVotingUnits(account, address(0), votes);
    }
}

abstract contract VotesExtendedTimestampMockUpgradeable is Initializable, VotesExtendedMockUpgradeable {
    function __VotesExtendedTimestampMock_init() internal onlyInitializing {
    }

    function __VotesExtendedTimestampMock_init_unchained() internal onlyInitializing {
    }
    function clock() public view override returns (uint48) {
        return uint48(block.timestamp);
    }

    // solhint-disable-next-line func-name-mixedcase
    function CLOCK_MODE() public view virtual override returns (string memory) {
        return "mode=timestamp";
    }
}
