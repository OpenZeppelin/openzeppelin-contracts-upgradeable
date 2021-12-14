// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.4.1 (governance/extensions/GovernorVotes.sol)

pragma solidity ^0.8.0;

import "../GovernorUpgradeable.sol";
import "../../token/ERC20/extensions/ERC20VotesUpgradeable.sol";
import "../../utils/math/MathUpgradeable.sol";
import "../../proxy/utils/Initializable.sol";

/**
 * @dev Extension of {Governor} for voting weight extraction from an {ERC20Votes} token.
 *
 * _Available since v4.3._
 */
abstract contract GovernorVotesUpgradeable is Initializable, GovernorUpgradeable {
    ERC20VotesUpgradeable public token;

    function __GovernorVotes_init(ERC20VotesUpgradeable tokenAddress) internal onlyInitializing {
        __Context_init_unchained();
        __ERC165_init_unchained();
        __IGovernor_init_unchained();
        __GovernorVotes_init_unchained(tokenAddress);
    }

    function __GovernorVotes_init_unchained(ERC20VotesUpgradeable tokenAddress) internal onlyInitializing {
        token = tokenAddress;
    }

    /**
     * Read the voting weight from the token's built in snapshot mechanism (see {IGovernor-getVotes}).
     */
    function getVotes(address account, uint256 blockNumber) public view virtual override returns (uint256) {
        return token.getPastVotes(account, blockNumber);
    }
    uint256[50] private __gap;
}
