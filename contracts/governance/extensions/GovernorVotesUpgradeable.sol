// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.9.0) (governance/extensions/GovernorVotes.sol)

pragma solidity ^0.8.20;

import { GovernorUpgradeable } from "../GovernorUpgradeable.sol";
import { IVotesUpgradeable } from "../utils/IVotesUpgradeable.sol";
import { IERC5805Upgradeable } from "../../interfaces/IERC5805Upgradeable.sol";
import { SafeCastUpgradeable } from "../../utils/math/SafeCastUpgradeable.sol";
import "../../proxy/utils/Initializable.sol";

/**
 * @dev Extension of {Governor} for voting weight extraction from an {ERC20Votes} token, or since v4.5 an {ERC721Votes} token.
 */
abstract contract GovernorVotesUpgradeable is Initializable, GovernorUpgradeable {
    /// @custom:storage-location erc7201:openzeppelin.storage.GovernorVotes
    struct GovernorVotesStorage {
        IERC5805Upgradeable _token;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.GovernorVotes")) - 1))
    bytes32 private constant GovernorVotesStorageLocation = 0x3ba4977254e415696610a40ebf2258dbfa0ec6a2ff64e84bfe715ff16977cc81;

    function _getGovernorVotesStorage() private pure returns (GovernorVotesStorage storage $) {
        assembly {
            $.slot := GovernorVotesStorageLocation
        }
    }

    function __GovernorVotes_init(IVotesUpgradeable tokenAddress) internal onlyInitializing {
        __GovernorVotes_init_unchained(tokenAddress);
    }

    function __GovernorVotes_init_unchained(IVotesUpgradeable tokenAddress) internal onlyInitializing {
        GovernorVotesStorage storage $ = _getGovernorVotesStorage();
        $._token = IERC5805Upgradeable(address(tokenAddress));
    }

    /**
     * @dev The token that voting power is sourced from.
     */
    function token() public view virtual returns (IERC5805Upgradeable) {
        GovernorVotesStorage storage $ = _getGovernorVotesStorage();
        return $._token;
    }

    /**
     * @dev Clock (as specified in EIP-6372) is set to match the token's clock. Fallback to block numbers if the token
     * does not implement EIP-6372.
     */
    function clock() public view virtual override returns (uint48) {
        try token().clock() returns (uint48 timepoint) {
            return timepoint;
        } catch {
            return SafeCastUpgradeable.toUint48(block.number);
        }
    }

    /**
     * @dev Machine-readable description of the clock as specified in EIP-6372.
     */
    // solhint-disable-next-line func-name-mixedcase
    function CLOCK_MODE() public view virtual override returns (string memory) {
        try token().CLOCK_MODE() returns (string memory clockmode) {
            return clockmode;
        } catch {
            return "mode=blocknumber&from=default";
        }
    }

    /**
     * Read the voting weight from the token's built in snapshot mechanism (see {Governor-_getVotes}).
     */
    function _getVotes(
        address account,
        uint256 timepoint,
        bytes memory /*params*/
    ) internal view virtual override returns (uint256) {
        return token().getPastVotes(account, timepoint);
    }
}
