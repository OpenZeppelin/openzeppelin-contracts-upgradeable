// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../token/ERC20/extensions/ERC4626Upgradeable.sol";
import "../proxy/utils/Initializable.sol";

contract ERC4626MockUpgradeable is Initializable, ERC4626Upgradeable {
    function __ERC4626Mock_init(
        IERC20MetadataUpgradeable asset,
        string memory name,
        string memory symbol
    ) internal onlyInitializing {
        __ERC20_init_unchained(name, symbol);
        __ERC4626_init_unchained(asset);
    }

    function __ERC4626Mock_init_unchained(
        IERC20MetadataUpgradeable,
        string memory,
        string memory
    ) internal onlyInitializing {}

    function mockMint(address account, uint256 amount) public {
        _mint(account, amount);
    }

    function mockBurn(address account, uint256 amount) public {
        _burn(account, amount);
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}

contract ERC4626DecimalMockUpgradeable is Initializable, ERC4626MockUpgradeable {
    using MathUpgradeable for uint256;

    uint8 private _decimals;

    function __ERC4626DecimalMock_init(
        IERC20MetadataUpgradeable asset,
        string memory name,
        string memory symbol,
        uint8 decimalsOverride
    ) internal onlyInitializing {
        __ERC20_init_unchained(name, symbol);
        __ERC4626_init_unchained(asset);
        __ERC4626Mock_init_unchained(asset, name, symbol);
        __ERC4626DecimalMock_init_unchained(asset, name, symbol, decimalsOverride);
    }

    function __ERC4626DecimalMock_init_unchained(
        IERC20MetadataUpgradeable,
        string memory,
        string memory,
        uint8 decimalsOverride
    ) internal onlyInitializing {
        _decimals = decimalsOverride;
    }

    function decimals() public view virtual override returns (uint8) {
        return _decimals;
    }

    function _initialConvertToShares(uint256 assets, MathUpgradeable.Rounding rounding)
        internal
        view
        virtual
        override
        returns (uint256 shares)
    {
        return assets.mulDiv(10**decimals(), 10**super.decimals(), rounding);
    }

    function _initialConvertToAssets(uint256 shares, MathUpgradeable.Rounding rounding)
        internal
        view
        virtual
        override
        returns (uint256 assets)
    {
        return shares.mulDiv(10**super.decimals(), 10**decimals(), rounding);
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[49] private __gap;
}
