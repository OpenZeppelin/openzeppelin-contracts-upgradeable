// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "../../../token/ERC20/ERC20Upgradeable.sol";
import "../../../token/ERC20/extensions/ERC20PermitUpgradeable.sol";
import "../../../token/ERC20/extensions/ERC20VotesUpgradeable.sol";
import "../../../token/ERC20/extensions/ERC20WrapperUpgradeable.sol";
import "../../../proxy/utils/Initializable.sol";

contract MyTokenWrappedUpgradeable is Initializable, ERC20Upgradeable, ERC20PermitUpgradeable, ERC20VotesUpgradeable, ERC20WrapperUpgradeable {
    function __MyTokenWrapped_init(
        IERC20Upgradeable wrappedToken
    ) internal onlyInitializing {
        __ERC20_init_unchained("MyTokenWrapped", "MTK");
        __EIP712_init_unchained("MyTokenWrapped", "1");
        __ERC20Permit_init_unchained("MyTokenWrapped");
        __ERC20Wrapper_init_unchained(wrappedToken);
    }

    function __MyTokenWrapped_init_unchained(
        IERC20Upgradeable
    ) internal onlyInitializing {}

    // The functions below are overrides required by Solidity.

    function decimals() public pure override(ERC20Upgradeable, ERC20WrapperUpgradeable) returns (uint8) {
        return 18;
    }

    function _afterTokenTransfer(address from, address to, uint256 amount) internal override(ERC20Upgradeable, ERC20VotesUpgradeable) {
        super._afterTokenTransfer(from, to, amount);
    }

    function _mint(address to, uint256 amount) internal override(ERC20Upgradeable, ERC20VotesUpgradeable) {
        super._mint(to, amount);
    }

    function _burn(address account, uint256 amount) internal override(ERC20Upgradeable, ERC20VotesUpgradeable) {
        super._burn(account, amount);
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}
