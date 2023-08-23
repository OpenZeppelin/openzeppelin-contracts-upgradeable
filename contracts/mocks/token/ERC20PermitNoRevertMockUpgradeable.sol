// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import { ERC20PermitUpgradeable } from "../../token/ERC20/extensions/ERC20PermitUpgradeable.sol";
import "../../proxy/utils/Initializable.sol";

abstract contract ERC20PermitNoRevertMockUpgradeable is Initializable, ERC20PermitUpgradeable {
    function __ERC20PermitNoRevertMock_init() internal onlyInitializing {
    }

    function __ERC20PermitNoRevertMock_init_unchained() internal onlyInitializing {
    }
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
}
