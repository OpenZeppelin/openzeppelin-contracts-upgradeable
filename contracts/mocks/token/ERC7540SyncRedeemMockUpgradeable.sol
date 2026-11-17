// SPDX-License-Identifier: MIT

pragma solidity ^0.8.31;

import {ERC7540Upgradeable} from "../../token/ERC20/extensions/ERC7540Upgradeable.sol";
import {ERC7540SyncRedeemUpgradeable} from "../../token/ERC20/extensions/ERC7540SyncRedeemUpgradeable.sol";
import {ERC7540AdminDepositUpgradeable} from "../../token/ERC20/extensions/ERC7540AdminDepositUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

abstract contract ERC7540SyncRedeemMockUpgradeable is Initializable, ERC7540SyncRedeemUpgradeable, ERC7540AdminDepositUpgradeable {
    function __ERC7540SyncRedeemMock_init() internal onlyInitializing {
    }

    function __ERC7540SyncRedeemMock_init_unchained() internal onlyInitializing {
    }
    function _requestDeposit(
        uint256 assets,
        address controller,
        address owner,
        uint256 requestId
    ) internal virtual override(ERC7540Upgradeable, ERC7540AdminDepositUpgradeable) {
        super._requestDeposit(assets, controller, owner, requestId);
    }
}
