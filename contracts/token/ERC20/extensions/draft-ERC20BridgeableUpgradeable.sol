// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.4.0) (token/ERC20/extensions/draft-ERC20Bridgeable.sol)

pragma solidity ^0.8.20;

import {ERC20Upgradeable} from "../ERC20Upgradeable.sol";
import {ERC165Upgradeable} from "../../../utils/introspection/ERC165Upgradeable.sol";
import {IERC165} from "@openzeppelin/contracts/utils/introspection/IERC165.sol";
import {IERC7802} from "@openzeppelin/contracts/interfaces/draft-IERC7802.sol";
import {Initializable} from "../../../proxy/utils/Initializable.sol";

/**
 * @dev ERC20 extension that implements the standard token interface according to
 * https://eips.ethereum.org/EIPS/eip-7802[ERC-7802].
 */
abstract contract ERC20BridgeableUpgradeable is Initializable, ERC20Upgradeable, ERC165Upgradeable, IERC7802 {
    /// @dev Modifier to restrict access to the token bridge.
    modifier onlyTokenBridge() {
        // Token bridge should never be impersonated using a relayer/forwarder. Using msg.sender is preferable to
        // _msgSender() for security reasons.
        _checkTokenBridge(msg.sender);
        _;
    }

    function __ERC20Bridgeable_init() internal onlyInitializing {
    }

    function __ERC20Bridgeable_init_unchained() internal onlyInitializing {
    }
    /// @inheritdoc ERC165Upgradeable
    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC165Upgradeable, IERC165) returns (bool) {
        return interfaceId == type(IERC7802).interfaceId || super.supportsInterface(interfaceId);
    }

    /**
     * @dev See {IERC7802-crosschainMint}. Emits a {IERC7802-CrosschainMint} event.
     */
    function crosschainMint(address to, uint256 value) public virtual override onlyTokenBridge {
        _mint(to, value);
        emit CrosschainMint(to, value, _msgSender());
    }

    /**
     * @dev See {IERC7802-crosschainBurn}. Emits a {IERC7802-CrosschainBurn} event.
     */
    function crosschainBurn(address from, uint256 value) public virtual override onlyTokenBridge {
        _burn(from, value);
        emit CrosschainBurn(from, value, _msgSender());
    }

    /**
     * @dev Checks if the caller is a trusted token bridge. MUST revert otherwise.
     *
     * Developers should implement this function using an access control mechanism that allows
     * customizing the list of allowed senders. Consider using {AccessControl} or {AccessManaged}.
     */
    function _checkTokenBridge(address caller) internal virtual;
}
