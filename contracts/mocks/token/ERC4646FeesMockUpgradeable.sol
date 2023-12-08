// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../docs/ERC4626FeesUpgradeable.sol";
import {Initializable} from "../../proxy/utils/Initializable.sol";

abstract contract ERC4626FeesMockUpgradeable is Initializable, ERC4626FeesUpgradeable {
    uint256 private _entryFeeBasisPointValue;
    address private _entryFeeRecipientValue;
    uint256 private _exitFeeBasisPointValue;
    address private _exitFeeRecipientValue;

    function __ERC4626FeesMock_init(
        uint256 entryFeeBasisPoints,
        address entryFeeRecipient,
        uint256 exitFeeBasisPoints,
        address exitFeeRecipient
    ) internal onlyInitializing {
        __ERC4626FeesMock_init_unchained(entryFeeBasisPoints, entryFeeRecipient, exitFeeBasisPoints, exitFeeRecipient);
    }

    function __ERC4626FeesMock_init_unchained(
        uint256 entryFeeBasisPoints,
        address entryFeeRecipient,
        uint256 exitFeeBasisPoints,
        address exitFeeRecipient
    ) internal onlyInitializing {
        _entryFeeBasisPointValue = entryFeeBasisPoints;
        _entryFeeRecipientValue = entryFeeRecipient;
        _exitFeeBasisPointValue = exitFeeBasisPoints;
        _exitFeeRecipientValue = exitFeeRecipient;
    }

    function _entryFeeBasisPoints() internal view virtual override returns (uint256) {
        return _entryFeeBasisPointValue;
    }

    function _entryFeeRecipient() internal view virtual override returns (address) {
        return _entryFeeRecipientValue;
    }

    function _exitFeeBasisPoints() internal view virtual override returns (uint256) {
        return _exitFeeBasisPointValue;
    }

    function _exitFeeRecipient() internal view virtual override returns (address) {
        return _exitFeeRecipientValue;
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[46] private __gap;
}
