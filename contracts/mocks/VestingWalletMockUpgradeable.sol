// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {VestingWalletUpgradeable} from "../finance/VestingWalletUpgradeable.sol";
import {VestingWalletCliffUpgradeable} from "../finance/VestingWalletCliffUpgradeable.sol";
import {ERC6372Utils} from "@openzeppelin/contracts/utils/ERC6372Utils.sol";
import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

abstract contract VestingWalletBlockNumberMockUpgradeable is Initializable, VestingWalletUpgradeable {
    function __VestingWalletBlockNumberMock_init() internal onlyInitializing {
    }

    function __VestingWalletBlockNumberMock_init_unchained() internal onlyInitializing {
    }
    function clock() public view override returns (uint48) {
        return Time.blockNumber();
    }

    // solhint-disable-next-line func-name-mixedcase
    function CLOCK_MODE() public view override returns (string memory) {
        return ERC6372Utils.blockNumberClockMode(clock());
    }
}

abstract contract VestingWalletCliffBlockNumberMockUpgradeable is Initializable, VestingWalletCliffUpgradeable {
    function __VestingWalletCliffBlockNumberMock_init() internal onlyInitializing {
    }

    function __VestingWalletCliffBlockNumberMock_init_unchained() internal onlyInitializing {
    }
    function clock() public view override returns (uint48) {
        return Time.blockNumber();
    }

    // solhint-disable-next-line func-name-mixedcase
    function CLOCK_MODE() public view override returns (string memory) {
        return ERC6372Utils.blockNumberClockMode(clock());
    }
}
