// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../utils/PausableUpgradeSafe.sol";
import "../Initializable.sol";

contract PausableMockUpgradeSafe is __Initializable, PausableUpgradeSafe {
    bool public drasticMeasureTaken;
    uint256 public count;

    function __PausableMock_init() internal __initializer {
        __Context_init_unchained();
        __Pausable_init_unchained();
        __PausableMock_init_unchained();
    }

    function __PausableMock_init_unchained() internal __initializer {
        drasticMeasureTaken = false;
        count = 0;
    }

    function normalProcess() external whenNotPaused {
        count++;
    }

    function drasticMeasure() external whenPaused {
        drasticMeasureTaken = true;
    }

    function pause() external {
        _pause();
    }

    function unpause() external {
        _unpause();
    }
}
