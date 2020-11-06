// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../utils/Create2UpgradeSafe.sol";
import "../introspection/ERC1820ImplementerUpgradeSafe.sol";
import "../Initializable.sol";

contract Create2ImplUpgradeSafe is __Initializable {
    function __Create2Impl_init() internal __initializer {
        __Create2Impl_init_unchained();
    }

    function __Create2Impl_init_unchained() internal __initializer {
    }
    function deploy(uint256 value, bytes32 salt, bytes memory code) public {
        Create2UpgradeSafe.deploy(value, salt, code);
    }

    function deployERC1820Implementer(uint256 value, bytes32 salt) public {
        // solhint-disable-next-line indent
        Create2UpgradeSafe.deploy(value, salt, type(ERC1820ImplementerUpgradeSafe).creationCode);
    }

    function computeAddress(bytes32 salt, bytes32 codeHash) public view returns (address) {
        return Create2UpgradeSafe.computeAddress(salt, codeHash);
    }

    function computeAddressWithDeployer(bytes32 salt, bytes32 codeHash, address deployer) public pure returns (address) {
        return Create2UpgradeSafe.computeAddress(salt, codeHash, deployer);
    }

    receive() payable external {}
}
