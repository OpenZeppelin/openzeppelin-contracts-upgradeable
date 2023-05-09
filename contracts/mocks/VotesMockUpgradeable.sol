// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../governance/utils/VotesUpgradeable.sol";
import "../proxy/utils/Initializable.sol";

abstract contract VotesMockUpgradeable is Initializable, VotesUpgradeable {
    function __VotesMock_init() internal onlyInitializing {
    }

    function __VotesMock_init_unchained() internal onlyInitializing {
    }
    mapping(address => uint256) private _balances;
    mapping(uint256 => address) private _owners;

    function getTotalSupply() public view returns (uint256) {
        return _getTotalSupply();
    }

    function delegate(address account, address newDelegation) public {
        return _delegate(account, newDelegation);
    }

    function _getVotingUnits(address account) internal view override returns (uint256) {
        return _balances[account];
    }

    function _mint(address account, uint256 voteId) internal {
        _balances[account] += 1;
        _owners[voteId] = account;
        _transferVotingUnits(address(0), account, 1);
    }

    function _burn(uint256 voteId) internal {
        address owner = _owners[voteId];
        _balances[owner] -= 1;
        _transferVotingUnits(owner, address(0), 1);
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[48] private __gap;
}

abstract contract VotesTimestampMockUpgradeable is Initializable, VotesMockUpgradeable {
    function __VotesTimestampMock_init() internal onlyInitializing {
    }

    function __VotesTimestampMock_init_unchained() internal onlyInitializing {
    }
    function clock() public view override returns (uint48) {
        return uint48(block.timestamp);
    }

    // solhint-disable-next-line func-name-mixedcase
    function CLOCK_MODE() public view virtual override returns (string memory) {
        return "mode=timestamp";
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}
