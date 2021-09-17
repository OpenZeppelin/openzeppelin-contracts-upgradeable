// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../governance/GovernorUpgradeable.sol";
import "../governance/extensions/GovernorCountingSimpleUpgradeable.sol";
import "../governance/extensions/GovernorVotesCompUpgradeable.sol";
import "../proxy/utils/Initializable.sol";

contract GovernorCompMockUpgradeable is Initializable, GovernorUpgradeable, GovernorVotesCompUpgradeable, GovernorCountingSimpleUpgradeable {
    uint256 _votingDelay;
    uint256 _votingPeriod;

    function __GovernorCompMock_init(
        string memory name_,
        ERC20VotesCompUpgradeable token_,
        uint256 votingDelay_,
        uint256 votingPeriod_
    ) internal initializer {
        __Context_init_unchained();
        __ERC165_init_unchained();
        __EIP712_init_unchained(name_, version());
        __IGovernor_init_unchained();
        __Governor_init_unchained(name_);
        __GovernorVotesComp_init_unchained(token_);
        __GovernorCountingSimple_init_unchained();
        __GovernorCompMock_init_unchained(name_, token_, votingDelay_, votingPeriod_);
    }

    function __GovernorCompMock_init_unchained(
        string memory name_,
        ERC20VotesCompUpgradeable token_,
        uint256 votingDelay_,
        uint256 votingPeriod_
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

    function quorum(uint256) public pure override returns (uint256) {
        return 0;
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
        override(IGovernorUpgradeable, GovernorVotesCompUpgradeable)
        returns (uint256)
    {
        return super.getVotes(account, blockNumber);
    }
    uint256[50] private __gap;
}
