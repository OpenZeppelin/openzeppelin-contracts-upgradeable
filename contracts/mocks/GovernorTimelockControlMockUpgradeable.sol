// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../governance/extensions/GovernorTimelockControlUpgradeable.sol";
import "../governance/extensions/GovernorCountingSimpleUpgradeable.sol";
import "../governance/extensions/GovernorVotesQuorumFractionUpgradeable.sol";
import "../proxy/utils/Initializable.sol";

contract GovernorTimelockControlMockUpgradeable is Initializable, GovernorTimelockControlUpgradeable, GovernorVotesQuorumFractionUpgradeable, GovernorCountingSimpleUpgradeable {
    uint256 _votingDelay;
    uint256 _votingPeriod;

    function __GovernorTimelockControlMock_init(
        string memory name_,
        ERC20VotesUpgradeable token_,
        uint256 votingDelay_,
        uint256 votingPeriod_,
        TimelockControllerUpgradeable timelock_,
        uint256 quorumNumerator_
    ) internal initializer {
        __Context_init_unchained();
        __ERC165_init_unchained();
        __EIP712_init_unchained(name_, version());
        __IGovernor_init_unchained();
        __IGovernorTimelock_init_unchained();
        __Governor_init_unchained(name_);
        __GovernorTimelockControl_init_unchained(timelock_);
        __GovernorVotes_init_unchained(token_);
        __GovernorVotesQuorumFraction_init_unchained(quorumNumerator_);
        __GovernorCountingSimple_init_unchained();
        __GovernorTimelockControlMock_init_unchained(name_, token_, votingDelay_, votingPeriod_, timelock_, quorumNumerator_);
    }

    function __GovernorTimelockControlMock_init_unchained(
        string memory name_,
        ERC20VotesUpgradeable token_,
        uint256 votingDelay_,
        uint256 votingPeriod_,
        TimelockControllerUpgradeable timelock_,
        uint256 quorumNumerator_
    ) internal initializer {
        _votingDelay = votingDelay_;
        _votingPeriod = votingPeriod_;
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(GovernorUpgradeable, GovernorTimelockControlUpgradeable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    function votingDelay() public view override returns (uint256) {
        return _votingDelay;
    }

    function votingPeriod() public view override returns (uint256) {
        return _votingPeriod;
    }

    function quorum(uint256 blockNumber)
        public
        view
        override(IGovernorUpgradeable, GovernorVotesQuorumFractionUpgradeable)
        returns (uint256)
    {
        return super.quorum(blockNumber);
    }

    function cancel(
        address[] memory targets,
        uint256[] memory values,
        bytes[] memory calldatas,
        bytes32 descriptionHash
    ) public returns (uint256 proposalId) {
        return _cancel(targets, values, calldatas, descriptionHash);
    }

    /**
     * Overriding nightmare
     */
    function state(uint256 proposalId)
        public
        view
        virtual
        override(GovernorUpgradeable, GovernorTimelockControlUpgradeable)
        returns (ProposalState)
    {
        return super.state(proposalId);
    }

    function _execute(
        uint256 proposalId,
        address[] memory targets,
        uint256[] memory values,
        bytes[] memory calldatas,
        bytes32 descriptionHash
    ) internal virtual override(GovernorUpgradeable, GovernorTimelockControlUpgradeable) {
        super._execute(proposalId, targets, values, calldatas, descriptionHash);
    }

    function _cancel(
        address[] memory targets,
        uint256[] memory values,
        bytes[] memory calldatas,
        bytes32 descriptionHash
    ) internal virtual override(GovernorUpgradeable, GovernorTimelockControlUpgradeable) returns (uint256 proposalId) {
        return super._cancel(targets, values, calldatas, descriptionHash);
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

    function _executor() internal view virtual override(GovernorUpgradeable, GovernorTimelockControlUpgradeable) returns (address) {
        return super._executor();
    }
    uint256[50] private __gap;
}
