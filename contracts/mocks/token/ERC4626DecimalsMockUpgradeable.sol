// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../../token/ERC20/extensions/ERC4626Upgradeable.sol";
import "../../proxy/utils/Initializable.sol";

abstract contract ERC4626DecimalsMockUpgradeable is Initializable, ERC4626Upgradeable {
    using MathUpgradeable for uint256;

    uint8 private _decimals;

    function __ERC4626DecimalsMock_init(uint8 decimals_) internal onlyInitializing {
        __ERC4626DecimalsMock_init_unchained(decimals_);
    }

    function __ERC4626DecimalsMock_init_unchained(uint8 decimals_) internal onlyInitializing {
        _decimals = decimals_;
    }

    function decimals() public view virtual override returns (uint8) {
        return _decimals;
    }

    function _initialConvertToShares(
        uint256 assets,
        MathUpgradeable.Rounding rounding
    ) internal view virtual override returns (uint256 shares) {
        return assets.mulDiv(10 ** decimals(), 10 ** super.decimals(), rounding);
    }

    function _initialConvertToAssets(
        uint256 shares,
        MathUpgradeable.Rounding rounding
    ) internal view virtual override returns (uint256 assets) {
        return shares.mulDiv(10 ** super.decimals(), 10 ** decimals(), rounding);
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[49] private __gap;
}
