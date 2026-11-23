// SPDX-License-Identifier: MIT

pragma solidity ^0.8.31;

import {OwnableUpgradeable} from "../../access/OwnableUpgradeable.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {IERC3643Identity} from "@openzeppelin/contracts/interfaces/IERC3643.sol";
import {ERC20Upgradeable} from "../../token/ERC20/ERC20Upgradeable.sol";
import {ERC3643Upgradeable} from "../../token/ERC20/extensions/ERC3643/ERC3643Upgradeable.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

contract ERC3643MockUpgradeable is Initializable, ERC3643Upgradeable, OwnableUpgradeable {
    function __ERC3643Mock_init(
        string memory name_,
        string memory symbol_,
        address identityRegistry_,
        address compliance_,
        address onchainID_,
        address owner_
    ) internal onlyInitializing {
        __ERC20_init_unchained(name_, symbol_);
        __ERC3643_init_unchained(identityRegistry_, compliance_, onchainID_);
        __Ownable_init_unchained(owner_);
    }

    function __ERC3643Mock_init_unchained(
        string memory,
        string memory,
        address,
        address,
        address,
        address
    ) internal onlyInitializing {}

    // Agents are not modeled: only the owner passes the admin check.
    function _checkAdmin() internal view override {
        _checkOwner();
    }
}

/// @dev Identity registry where a wallet is verified when the identity it is registered with is verified.
contract ERC3643IdentityRegistryMockUpgradeable is Initializable {
    mapping(address user => IERC3643Identity) private _identities;
    mapping(address user => uint16) private _countries;
    mapping(IERC3643Identity identity => bool) private _verified;

    event IdentityRegistered(address indexed investorAddress, IERC3643Identity indexed identity);
    event IdentityRemoved(address indexed investorAddress, IERC3643Identity indexed identity);

    error ERC3643IdentityRegistryMockAlreadyRegistered(address user);
    error ERC3643IdentityRegistryMockNotRegistered(address user);

    function __ERC3643IdentityRegistryMock_init() internal onlyInitializing {
    }

    function __ERC3643IdentityRegistryMock_init_unchained() internal onlyInitializing {
    }
    function setIdentity(address user, IERC3643Identity identity_) public {
        _identities[user] = identity_;
    }

    function setVerified(IERC3643Identity identity_, bool verified) public {
        _verified[identity_] = verified;
    }

    // Follows the ERC requirements: a wallet is registered once and deleted only if registered.
    function registerIdentity(address user, IERC3643Identity identity_, uint16 country) public {
        require(address(_identities[user]) == address(0), ERC3643IdentityRegistryMockAlreadyRegistered(user));
        _identities[user] = identity_;
        _countries[user] = country;
        emit IdentityRegistered(user, identity_);
    }

    function deleteIdentity(address user) public {
        IERC3643Identity identity_ = _identities[user];
        require(address(identity_) != address(0), ERC3643IdentityRegistryMockNotRegistered(user));
        delete _identities[user];
        delete _countries[user];
        emit IdentityRemoved(user, identity_);
    }

    function identity(address user) public view returns (IERC3643Identity) {
        return _identities[user];
    }

    function investorCountry(address user) public view returns (uint16) {
        return _countries[user];
    }

    function isVerified(address user) public view returns (bool) {
        IERC3643Identity identity_ = _identities[user];
        return address(identity_) != address(0) && _verified[identity_];
    }
}

/// @dev Compliance whose answer to `canTransfer` is set by the test, and that records every notification.
contract ERC3643ComplianceMockUpgradeable is Initializable {
    bool private _canTransfer;

    event Transferred(address from, address to, uint256 amount);
    event Created(address to, uint256 amount);
    event Destroyed(address from, uint256 amount);

    function __ERC3643ComplianceMock_init() internal onlyInitializing {
        __ERC3643ComplianceMock_init_unchained();
    }

    function __ERC3643ComplianceMock_init_unchained() internal onlyInitializing {
        _canTransfer = true;
    }
    function setCanTransfer(bool canTransfer_) public {
        _canTransfer = canTransfer_;
    }

    function canTransfer(address, address, uint256) public view returns (bool) {
        return _canTransfer;
    }

    function transferred(address from, address to, uint256 amount) public virtual {
        emit Transferred(from, to, amount);
    }

    function created(address to, uint256 amount) public {
        emit Created(to, amount);
    }

    function destroyed(address from, uint256 amount) public {
        emit Destroyed(from, amount);
    }
}

/// @dev Compliance that, once armed, spends `to`'s tokens from its `transferred` notification.
contract ERC3643ReentrantComplianceMockUpgradeable is Initializable, ERC3643ComplianceMockUpgradeable {
    address private _receiver;
    uint256 private _amount;

    function __ERC3643ReentrantComplianceMock_init() internal onlyInitializing {
        __ERC3643ComplianceMock_init_unchained();
    }

    function __ERC3643ReentrantComplianceMock_init_unchained() internal onlyInitializing {
    }
    function setReentry(address receiver, uint256 amount) public {
        _receiver = receiver;
        _amount = amount;
    }

    function transferred(address from, address to, uint256 amount) public override {
        super.transferred(from, to, amount);
        uint256 reentryAmount = _amount;
        if (reentryAmount > 0) {
            _amount = 0; // reenter once
            IERC20(msg.sender).transferFrom(to, _receiver, reentryAmount);
        }
    }
}
