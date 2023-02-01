// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../../token/ERC20/ERC20Upgradeable.sol";
import "../../token/ERC20/extensions/draft-ERC20PermitUpgradeable.sol";
import "../../proxy/utils/Initializable.sol";

contract ERC20PermitNoRevertMockUpgradeable is Initializable, ERC20Upgradeable, ERC20PermitUpgradeable {
    function __ERC20PermitNoRevertMock_init() internal onlyInitializing {
        __ERC20_init_unchained("ERC20PermitNoRevertMock", "ERC20PermitNoRevertMock");
        __EIP712_init_unchained("ERC20PermitNoRevertMock", "1");
        __ERC20Permit_init_unchained("ERC20PermitNoRevertMock");
    }

    function __ERC20PermitNoRevertMock_init_unchained() internal onlyInitializing {}

    function permitThatMayRevert(
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) public virtual {
        super.permit(owner, spender, value, deadline, v, r, s);
    }

    function permit(
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) public virtual override {
        try this.permitThatMayRevert(owner, spender, value, deadline, v, r, s) {
            // do nothing
        } catch {
            // do nothing
        }
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}
