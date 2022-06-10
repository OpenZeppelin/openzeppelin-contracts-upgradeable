// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../utils/ContextUpgradeable.sol";
import "../token/ERC20/IERC20Upgradeable.sol";
import "../token/ERC20/extensions/draft-ERC20PermitUpgradeable.sol";
import "../token/ERC20/utils/SafeERC20Upgradeable.sol";
import "../proxy/utils/Initializable.sol";

contract ERC20ReturnFalseMockUpgradeable is Initializable, ContextUpgradeable {
    function __ERC20ReturnFalseMock_init() internal onlyInitializing {
    }

    function __ERC20ReturnFalseMock_init_unchained() internal onlyInitializing {
    }
    uint256 private _allowance;

    // IERC20's functions are not pure, but these mock implementations are: to prevent Solidity from issuing warnings,
    // we write to a dummy state variable.
    uint256 private _dummy;

    function transfer(address, uint256) public returns (bool) {
        _dummy = 0;
        return false;
    }

    function transferFrom(
        address,
        address,
        uint256
    ) public returns (bool) {
        _dummy = 0;
        return false;
    }

    function approve(address, uint256) public returns (bool) {
        _dummy = 0;
        return false;
    }

    function allowance(address, address) public view returns (uint256) {
        require(_dummy == 0); // Dummy read from a state variable so that the function is view
        return 0;
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[48] private __gap;
}

contract ERC20ReturnTrueMockUpgradeable is Initializable, ContextUpgradeable {
    function __ERC20ReturnTrueMock_init() internal onlyInitializing {
    }

    function __ERC20ReturnTrueMock_init_unchained() internal onlyInitializing {
    }
    mapping(address => uint256) private _allowances;

    // IERC20's functions are not pure, but these mock implementations are: to prevent Solidity from issuing warnings,
    // we write to a dummy state variable.
    uint256 private _dummy;

    function transfer(address, uint256) public returns (bool) {
        _dummy = 0;
        return true;
    }

    function transferFrom(
        address,
        address,
        uint256
    ) public returns (bool) {
        _dummy = 0;
        return true;
    }

    function approve(address, uint256) public returns (bool) {
        _dummy = 0;
        return true;
    }

    function setAllowance(uint256 allowance_) public {
        _allowances[_msgSender()] = allowance_;
    }

    function allowance(address owner, address) public view returns (uint256) {
        return _allowances[owner];
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[48] private __gap;
}

contract ERC20NoReturnMockUpgradeable is Initializable, ContextUpgradeable {
    function __ERC20NoReturnMock_init() internal onlyInitializing {
    }

    function __ERC20NoReturnMock_init_unchained() internal onlyInitializing {
    }
    mapping(address => uint256) private _allowances;

    // IERC20's functions are not pure, but these mock implementations are: to prevent Solidity from issuing warnings,
    // we write to a dummy state variable.
    uint256 private _dummy;

    function transfer(address, uint256) public {
        _dummy = 0;
    }

    function transferFrom(
        address,
        address,
        uint256
    ) public {
        _dummy = 0;
    }

    function approve(address, uint256) public {
        _dummy = 0;
    }

    function setAllowance(uint256 allowance_) public {
        _allowances[_msgSender()] = allowance_;
    }

    function allowance(address owner, address) public view returns (uint256) {
        return _allowances[owner];
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[48] private __gap;
}

contract ERC20PermitNoRevertMockUpgradeable is
    Initializable, ERC20Upgradeable,
    ERC20PermitUpgradeable
{
    function __ERC20PermitNoRevertMock_init() internal onlyInitializing {
        __ERC20_init_unchained("ERC20PermitNoRevertMock", "ERC20PermitNoRevertMock");
        __EIP712_init_unchained("ERC20PermitNoRevertMock", "1");
        __ERC20Permit_init_unchained("ERC20PermitNoRevertMock");
    }

    function __ERC20PermitNoRevertMock_init_unchained() internal onlyInitializing {
    }
    function getChainId() external view returns (uint256) {
        return block.chainid;
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

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}

contract SafeERC20WrapperUpgradeable is Initializable, ContextUpgradeable {
    using SafeERC20Upgradeable for IERC20Upgradeable;

    IERC20Upgradeable private _token;

    function __SafeERC20Wrapper_init(IERC20Upgradeable token) internal onlyInitializing {
        __SafeERC20Wrapper_init_unchained(token);
    }

    function __SafeERC20Wrapper_init_unchained(IERC20Upgradeable token) internal onlyInitializing {
        _token = token;
    }

    function transfer() public {
        _token.safeTransfer(address(0), 0);
    }

    function transferFrom() public {
        _token.safeTransferFrom(address(0), address(0), 0);
    }

    function approve(uint256 amount) public {
        _token.safeApprove(address(0), amount);
    }

    function increaseAllowance(uint256 amount) public {
        _token.safeIncreaseAllowance(address(0), amount);
    }

    function decreaseAllowance(uint256 amount) public {
        _token.safeDecreaseAllowance(address(0), amount);
    }

    function permit(
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) public {
        SafeERC20Upgradeable.safePermit(IERC20PermitUpgradeable(address(_token)), owner, spender, value, deadline, v, r, s);
    }

    function setAllowance(uint256 allowance_) public {
        ERC20ReturnTrueMockUpgradeable(address(_token)).setAllowance(allowance_);
    }

    function allowance() public view returns (uint256) {
        return _token.allowance(address(0), address(0));
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[49] private __gap;
}
