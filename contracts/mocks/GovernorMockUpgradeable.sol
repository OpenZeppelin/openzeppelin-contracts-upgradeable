// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../governance/GovernorUpgradeable.sol";
import "../governance/extensions/GovernorCountingSimpleUpgradeable.sol";
import "../governance/extensions/GovernorVotesQuorumFractionUpgradeable.sol";
import "../proxy/utils/Initializable.sol";

contract GovernorMockUpgradeable is Initializable, GovernorUpgradeable, GovernorVotesQuorumFractionUpgradeable, GovernorCountingSimpleUpgradeable {
    uint256 _votingDelay;
    uint256 _votingPeriod;

    function __GovernorMock_init(
        string memory name_,
        ERC20VotesUpgradeable token_,
        uint256 votingDelay_,
        uint256 votingPeriod_,
        uint256 quorumNumerator_
    ) internal initializer {
        __Context_init_unchained();
        __ERC165_init_unchained();
        __EIP712_init_unchained(name_, version());
        __IGovernor_init_unchained();
        __Governor_init_unchained(name_);
        __GovernorVotes_init_unchained(token_);
        __GovernorVotesQuorumFraction_init_unchained(quorumNumerator_);
        __GovernorCountingSimple_init_unchained();
        __GovernorMock_init_unchained(name_, token_, votingDelay_, votingPeriod_, quorumNumerator_);
    }

    function __GovernorMock_init_unchained(
        string memory name_,
        ERC20VotesUpgradeable token_,
        uint256 votingDelay_,
        uint256 votingPeriod_,
        uint256 quorumNumerator_
    ) internal initializer {
        _votingDelay = votingDelay_;
        _votingPeriod = votingPeriod_;
    }

    function votingDelay() public view override returns (uint256) {
        return _votingDelay;
    }

    function votingPeriod() public view override returns (uint256) {
        return _votingPeriod;
    }

    function cancel(
        address[] memory targets,
        uint256[] memory values,
        bytes[] memory calldatas,
        bytes32 salt
    ) public returns (uint256 proposalId) {
        return _cancel(targets, values, calldatas, salt);
    }

    function getVotes(address account, uint256 blockNumber)
        public
        view
        virtual
        override(IGovernorUpgradeable, GovernorVotesUpgradeable)
        returns (uint256)
    {
        return super.getVotes(account, blockNumber);
    }
    uint256[50] private __gap;
}
