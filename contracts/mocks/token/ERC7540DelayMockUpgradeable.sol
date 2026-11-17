// SPDX-License-Identifier: MIT

pragma solidity ^0.8.31;

import {ERC7540Upgradeable} from "../../token/ERC20/extensions/ERC7540Upgradeable.sol";
import {ERC7540DelayDepositUpgradeable} from "../../token/ERC20/extensions/ERC7540DelayDepositUpgradeable.sol";
import {ERC7540DelayRedeemUpgradeable} from "../../token/ERC20/extensions/ERC7540DelayRedeemUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

abstract contract ERC7540DelayMockUpgradeable is Initializable, ERC7540DelayDepositUpgradeable, ERC7540DelayRedeemUpgradeable {
    function __ERC7540DelayMock_init() internal onlyInitializing {
        __ERC7540DelayDeposit_init_unchained();
        __ERC7540DelayRedeem_init_unchained();
    }

    function __ERC7540DelayMock_init_unchained() internal onlyInitializing {
    }
    function clock() public view virtual override(ERC7540DelayDepositUpgradeable, ERC7540DelayRedeemUpgradeable) returns (uint48) {
        return super.clock();
    }

    // solhint-disable-next-line func-name-mixedcase
    function CLOCK_MODE()
        public
        view
        virtual
        override(ERC7540DelayDepositUpgradeable, ERC7540DelayRedeemUpgradeable)
        returns (string memory)
    {
        return super.CLOCK_MODE();
    }

    function _requestDeposit(
        uint256 assets,
        address controller,
        address owner,
        uint256 requestId
    ) internal virtual override(ERC7540Upgradeable, ERC7540DelayDepositUpgradeable) {
        super._requestDeposit(assets, controller, owner, requestId);
    }

    function _requestRedeem(
        uint256 shares,
        address controller,
        address owner,
        uint256 requestId
    ) internal virtual override(ERC7540Upgradeable, ERC7540DelayRedeemUpgradeable) {
        super._requestRedeem(shares, controller, owner, requestId);
    }
}

abstract contract ERC7540DelayShareOriginMockUpgradeable is Initializable, ERC7540DelayMockUpgradeable {
    function __ERC7540DelayShareOriginMock_init() internal onlyInitializing {
        __ERC7540DelayDeposit_init_unchained();
        __ERC7540DelayRedeem_init_unchained();
    }

    function __ERC7540DelayShareOriginMock_init_unchained() internal onlyInitializing {
    }
    function _depositShareOrigin() internal view virtual override returns (address) {
        return address(this);
    }
}

abstract contract ERC7540DelayShareDestinationMockUpgradeable is Initializable, ERC7540DelayMockUpgradeable {
    function __ERC7540DelayShareDestinationMock_init() internal onlyInitializing {
        __ERC7540DelayDeposit_init_unchained();
        __ERC7540DelayRedeem_init_unchained();
    }

    function __ERC7540DelayShareDestinationMock_init_unchained() internal onlyInitializing {
    }
    function _redeemShareDestination() internal view virtual override returns (address) {
        return address(this);
    }
}
