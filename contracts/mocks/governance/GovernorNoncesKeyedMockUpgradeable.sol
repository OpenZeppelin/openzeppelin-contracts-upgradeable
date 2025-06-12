// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {GovernorUpgradeable, NoncesUpgradeable} from "../../governance/GovernorUpgradeable.sol";
import {GovernorSettingsUpgradeable} from "../../governance/extensions/GovernorSettingsUpgradeable.sol";
import {GovernorCountingSimpleUpgradeable} from "../../governance/extensions/GovernorCountingSimpleUpgradeable.sol";
import {GovernorVotesQuorumFractionUpgradeable} from "../../governance/extensions/GovernorVotesQuorumFractionUpgradeable.sol";
import {GovernorProposalGuardianUpgradeable} from "../../governance/extensions/GovernorProposalGuardianUpgradeable.sol";
import {GovernorNoncesKeyedUpgradeable} from "../../governance/extensions/GovernorNoncesKeyedUpgradeable.sol";
import {Initializable} from "../../proxy/utils/Initializable.sol";

abstract contract GovernorNoncesKeyedMockUpgradeable is
    Initializable, GovernorSettingsUpgradeable,
    GovernorVotesQuorumFractionUpgradeable,
    GovernorCountingSimpleUpgradeable,
    GovernorNoncesKeyedUpgradeable
{
    function __GovernorNoncesKeyedMock_init() internal onlyInitializing {
    }

    function __GovernorNoncesKeyedMock_init_unchained() internal onlyInitializing {
    }
    function proposalThreshold() public view override(GovernorUpgradeable, GovernorSettingsUpgradeable) returns (uint256) {
        return super.proposalThreshold();
    }

    function _validateVoteSig(
        uint256 proposalId,
        uint8 support,
        address voter,
        bytes memory signature
    ) internal virtual override(GovernorUpgradeable, GovernorNoncesKeyedUpgradeable) returns (bool) {
        return super._validateVoteSig(proposalId, support, voter, signature);
    }

    function _validateExtendedVoteSig(
        uint256 proposalId,
        uint8 support,
        address voter,
        string memory reason,
        bytes memory params,
        bytes memory signature
    ) internal virtual override(GovernorUpgradeable, GovernorNoncesKeyedUpgradeable) returns (bool) {
        return super._validateExtendedVoteSig(proposalId, support, voter, reason, params, signature);
    }

    function _useCheckedNonce(address owner, uint256 nonce) internal virtual override(NoncesUpgradeable, GovernorNoncesKeyedUpgradeable) {
        super._useCheckedNonce(owner, nonce);
    }
}
