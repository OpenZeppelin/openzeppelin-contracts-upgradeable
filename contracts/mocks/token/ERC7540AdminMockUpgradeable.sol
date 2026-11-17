// SPDX-License-Identifier: MIT

pragma solidity ^0.8.31;

import {ERC7540Upgradeable} from "../../token/ERC20/extensions/ERC7540Upgradeable.sol";
import {ERC7540AdminDepositUpgradeable} from "../../token/ERC20/extensions/ERC7540AdminDepositUpgradeable.sol";
import {ERC7540AdminRedeemUpgradeable} from "../../token/ERC20/extensions/ERC7540AdminRedeemUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

abstract contract ERC7540AdminMockUpgradeable is Initializable, ERC7540AdminDepositUpgradeable, ERC7540AdminRedeemUpgradeable {
    address private _tmpShareHolder;

    function __ERC7540AdminMock_init(address tmpShareHolder) internal onlyInitializing {
        __ERC7540AdminMock_init_unchained(tmpShareHolder);
    }

    function __ERC7540AdminMock_init_unchained(address tmpShareHolder) internal onlyInitializing {
        _tmpShareHolder = tmpShareHolder;
    }

    function _requestDeposit(
        uint256 assets,
        address controller,
        address owner,
        uint256 requestId
    ) internal virtual override(ERC7540Upgradeable, ERC7540AdminDepositUpgradeable) {
        super._requestDeposit(assets, controller, owner, requestId);
    }

    function _requestRedeem(
        uint256 shares,
        address controller,
        address owner,
        uint256 requestId
    ) internal virtual override(ERC7540Upgradeable, ERC7540AdminRedeemUpgradeable) {
        super._requestRedeem(shares, controller, owner, requestId);
    }

    function _depositShareOrigin() internal view virtual override returns (address) {
        return _tmpShareHolder;
    }

    function _redeemShareDestination() internal view virtual override returns (address) {
        return _tmpShareHolder;
    }
}
