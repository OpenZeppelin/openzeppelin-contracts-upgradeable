// SPDX-License-Identifier: MIT

pragma solidity ^0.8.31;

import {ERC7540Upgradeable} from "../../token/ERC20/extensions/ERC7540Upgradeable.sol";
import {ERC7540EpochDepositUpgradeable} from "../../token/ERC20/extensions/ERC7540EpochDepositUpgradeable.sol";
import {ERC7540EpochRedeemUpgradeable} from "../../token/ERC20/extensions/ERC7540EpochRedeemUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

abstract contract ERC7540EpochMockUpgradeable is Initializable, ERC7540EpochDepositUpgradeable, ERC7540EpochRedeemUpgradeable {
    address private _tmpShareHolder;

    function __ERC7540EpochMock_init(address tmpShareHolder) internal onlyInitializing {
        __ERC7540EpochMock_init_unchained(tmpShareHolder);
    }

    function __ERC7540EpochMock_init_unchained(address tmpShareHolder) internal onlyInitializing {
        _tmpShareHolder = tmpShareHolder;
    }

    function _requestDeposit(
        uint256 assets,
        address controller,
        address owner,
        uint256 requestId
    ) internal virtual override(ERC7540Upgradeable, ERC7540EpochDepositUpgradeable) {
        super._requestDeposit(assets, controller, owner, requestId);
    }

    function _requestRedeem(
        uint256 shares,
        address controller,
        address owner,
        uint256 requestId
    ) internal virtual override(ERC7540Upgradeable, ERC7540EpochRedeemUpgradeable) {
        super._requestRedeem(shares, controller, owner, requestId);
    }

    function _depositShareOrigin() internal view virtual override returns (address) {
        return _tmpShareHolder;
    }

    function _redeemShareDestination() internal view virtual override returns (address) {
        return _tmpShareHolder;
    }
}
