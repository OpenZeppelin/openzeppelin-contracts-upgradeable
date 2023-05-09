// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../../governance/extensions/GovernorCountingSimpleUpgradeable.sol";
import "../../governance/extensions/GovernorVotesCompUpgradeable.sol";
import "../../proxy/utils/Initializable.sol";

abstract contract GovernorCompMockUpgradeable is Initializable, GovernorVotesCompUpgradeable, GovernorCountingSimpleUpgradeable {
    function __GovernorCompMock_init() internal onlyInitializing {
    }

    function __GovernorCompMock_init_unchained() internal onlyInitializing {
    }
    function quorum(uint256) public pure override returns (uint256) {
        return 0;
    }

    function votingDelay() public pure override returns (uint256) {
        return 4;
    }

    function votingPeriod() public pure override returns (uint256) {
        return 16;
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}
