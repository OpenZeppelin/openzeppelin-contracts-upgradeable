// SPDX-License-Identifier: MIT

pragma solidity ^0.8.31;

import {ERC7540Upgradeable} from "../../token/ERC20/extensions/ERC7540Upgradeable.sol";
import {ERC7540SyncDepositUpgradeable} from "../../token/ERC20/extensions/ERC7540SyncDepositUpgradeable.sol";
import {ERC7540AdminRedeemUpgradeable} from "../../token/ERC20/extensions/ERC7540AdminRedeemUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

abstract contract ERC7540SyncDepositMockUpgradeable is Initializable, ERC7540SyncDepositUpgradeable, ERC7540AdminRedeemUpgradeable {
    function __ERC7540SyncDepositMock_init() internal onlyInitializing {
    }

    function __ERC7540SyncDepositMock_init_unchained() internal onlyInitializing {
    }
    function _requestRedeem(
        uint256 shares,
        address controller,
        address owner,
        uint256 requestId
    ) internal virtual override(ERC7540Upgradeable, ERC7540AdminRedeemUpgradeable) {
        super._requestRedeem(shares, controller, owner, requestId);
    }
}
