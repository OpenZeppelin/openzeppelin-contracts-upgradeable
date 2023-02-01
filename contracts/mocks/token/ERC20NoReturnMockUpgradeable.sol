// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "../../proxy/utils/Initializable.sol";

contract ERC20NoReturnMockUpgradeable is Initializable {
    function __ERC20NoReturnMock_init() internal onlyInitializing {
    }

    function __ERC20NoReturnMock_init_unchained() internal onlyInitializing {
    }
    mapping(address => uint256) private _allowances;

    function transfer(address, uint256) public {}

    function transferFrom(address, address, uint256) public {}

    function approve(address, uint256) public {}

    function setAllowance(address account, uint256 allowance_) public {
        _allowances[account] = allowance_;
    }

    function allowance(address owner, address) public view returns (uint256) {
        return _allowances[owner];
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[49] private __gap;
}
