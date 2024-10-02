// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {ERC20Upgradeable} from "../../token/ERC20/ERC20Upgradeable.sol";
import {ERC1363Upgradeable} from "../../token/ERC20/extensions/ERC1363Upgradeable.sol";
import {Initializable} from "../../proxy/utils/Initializable.sol";

abstract contract ERC1363ReturnFalseOnERC20MockUpgradeable is Initializable, ERC1363Upgradeable {
    function __ERC1363ReturnFalseOnERC20Mock_init() internal onlyInitializing {
    }

    function __ERC1363ReturnFalseOnERC20Mock_init_unchained() internal onlyInitializing {
    }
    function transfer(address, uint256) public pure override(IERC20, ERC20Upgradeable) returns (bool) {
        return false;
    }

    function transferFrom(address, address, uint256) public pure override(IERC20, ERC20Upgradeable) returns (bool) {
        return false;
    }

    function approve(address, uint256) public pure override(IERC20, ERC20Upgradeable) returns (bool) {
        return false;
    }
}

abstract contract ERC1363ReturnFalseMockUpgradeable is Initializable, ERC1363Upgradeable {
    function __ERC1363ReturnFalseMock_init() internal onlyInitializing {
    }

    function __ERC1363ReturnFalseMock_init_unchained() internal onlyInitializing {
    }
    function transferAndCall(address, uint256, bytes memory) public pure override returns (bool) {
        return false;
    }

    function transferFromAndCall(address, address, uint256, bytes memory) public pure override returns (bool) {
        return false;
    }

    function approveAndCall(address, uint256, bytes memory) public pure override returns (bool) {
        return false;
    }
}
