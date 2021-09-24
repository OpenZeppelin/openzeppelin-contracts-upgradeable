// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/**
 * @dev This is a base contract to aid in writing upgradeable contracts, or any kind of contract that will be deployed
 * behind a proxy. Since a proxied contract can't have a constructor, it's common to move constructor logic to an
 * external initializer function, usually called `initialize`. It then becomes necessary to protect this initializer
 * function so it can only be called once. The {initializer} modifier provided by this contract will have this effect.
 *
 * TIP: To avoid leaving the proxy in an uninitialized state, the initializer function should be called as early as
 * possible by providing the encoded function call as the `_data` argument to {ERC1967Proxy-constructor}.
 *
 * CAUTION: When used with inheritance, manual care must be taken to not invoke a parent initializer twice, or to ensure
 * that all initializers are idempotent. This is not verified automatically as constructors are by Solidity.
 *
 * [CAUTION]
 * ====
 * Avoid leaving a contract uninitialized.
 *
 * An uninitialized contract can be taken over by an attacker. This applies to both a proxy and its implementation
 * contract, which may impact the proxy. To initialize the implementation contract, you can either invoke the
 * initializer manually, or you can include a constructor to automatically mark it as initialized when it is deployed:
 *
 * [.hljs-theme-light.nopadding]
 * ```
 * /// @custom:oz-upgrades-unsafe-allow constructor
 * constructor() initializer {}
 * ```
 * ====
 */
abstract contract Initializable {
    /**
     * @dev Indicates that the contract has been initialized to this level.
     */
    uint256 private _upgradeLevel;

    /**
     * @dev Indicates that the contract is in the process of being initialized.
     */
    bool private _initializing;

    /**
     * @dev Modifier to protect an initializer function from being invoked twice.
     */
    modifier initializer() {
        bool isTopLevelCall = _preInitialize(0);
        _;
        if (isTopLevelCall) {
            _initializing = false;
        }
    }

    /**
     * @dev Modifier to protect an initializer function from being invoked twice.
     */
    modifier upgradeInit(uint256 upgradeLevel) {
        bool isTopLevelCall = _preInitialize(upgradeLevel);
        _;
        if (isTopLevelCall) {
            _initializing = false;
        }
    }

    function _preInitialize(uint256 upgradeLevel) private returns(bool) {
        require(_initializing || _upgradeLevel <= upgradeLevel, "Initializable: contract is already initialized");
        if (!_initializing) {
            _initializing = true;
            _upgradeLevel = _upgradeLevel + 1;
            return true;
        }
        return false;
    }

    function getUpgradeLevel() public view returns(uint256) {
        return _upgradeLevel;
    }
}
