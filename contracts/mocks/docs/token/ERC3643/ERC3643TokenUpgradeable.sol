// contracts/ERC3643Token.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

import {AccessControlUpgradeable} from "../../../../access/AccessControlUpgradeable.sol";
import {ERC20Upgradeable} from "../../../../token/ERC20/ERC20Upgradeable.sol";
import {ERC3643Upgradeable} from "../../../../token/ERC3643/ERC3643Upgradeable.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

contract ERC3643TokenUpgradeable is Initializable, ERC3643Upgradeable, AccessControlUpgradeable {
    bytes32 public constant AGENT_ROLE = keccak256("AGENT_ROLE");

    function __ERC3643Token_init(
        address identityRegistry,
        address compliance,
        address admin
    ) internal onlyInitializing {
        __ERC20_init_unchained("Security Token", "SEC");
        __ERC3643_init_unchained(identityRegistry, compliance, address(0));
        __ERC3643Token_init_unchained(identityRegistry, compliance, admin);
    }

    function __ERC3643Token_init_unchained(
        address,
        address,
        address admin
    ) internal onlyInitializing {
        _grantRole(DEFAULT_ADMIN_ROLE, admin);
    }

    function _checkAdmin() internal view override {
        bytes4 selector = msg.sig;
        bool ownerOnly =
            selector == this.setName.selector ||
                selector == this.setSymbol.selector ||
                selector == this.setOnchainID.selector ||
                selector == this.setIdentityRegistry.selector ||
                selector == this.setCompliance.selector;
        _checkRole(ownerOnly ? DEFAULT_ADMIN_ROLE : AGENT_ROLE);
    }
}
