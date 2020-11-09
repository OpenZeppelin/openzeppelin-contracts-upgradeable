// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../GSN/ContextUpgradeSafe.sol";
import "../token/ERC20/IERC20UpgradeSafe.sol";
import "../token/ERC20/SafeERC20UpgradeSafe.sol";
import "../Initializable.sol";

contract ERC20ReturnFalseMockUpgradeSafe is __Initializable, ContextUpgradeSafe {
    function __ERC20ReturnFalseMock_init() internal __initializer {
        __Context_init_unchained();
        __ERC20ReturnFalseMock_init_unchained();
    }

    function __ERC20ReturnFalseMock_init_unchained() internal __initializer {
    }
    uint256 private _allowance;

    // IERC20's functions are not pure, but these mock implementations are: to prevent Solidity from issuing warnings,
    // we write to a dummy state variable.
    uint256 private _dummy;

    function transfer(address, uint256) public returns (bool) {
        _dummy = 0;
        return false;
    }

    function transferFrom(address, address, uint256) public returns (bool) {
        _dummy = 0;
        return false;
    }

    function approve(address, uint256) public returns (bool) {
        _dummy = 0;
        return false;
    }

    function allowance(address, address) public view returns (uint256) {
        require(_dummy == 0); // Duummy read from a state variable so that the function is view
        return 0;
    }
    uint256[48] private __gap;
}

contract ERC20ReturnTrueMockUpgradeSafe is __Initializable, ContextUpgradeSafe {
    function __ERC20ReturnTrueMock_init() internal __initializer {
        __Context_init_unchained();
        __ERC20ReturnTrueMock_init_unchained();
    }

    function __ERC20ReturnTrueMock_init_unchained() internal __initializer {
    }
    mapping (address => uint256) private _allowances;

    // IERC20's functions are not pure, but these mock implementations are: to prevent Solidity from issuing warnings,
    // we write to a dummy state variable.
    uint256 private _dummy;

    function transfer(address, uint256) public returns (bool) {
        _dummy = 0;
        return true;
    }

    function transferFrom(address, address, uint256) public returns (bool) {
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
    uint256[48] private __gap;
}

contract ERC20NoReturnMockUpgradeSafe is __Initializable, ContextUpgradeSafe {
    function __ERC20NoReturnMock_init() internal __initializer {
        __Context_init_unchained();
        __ERC20NoReturnMock_init_unchained();
    }

    function __ERC20NoReturnMock_init_unchained() internal __initializer {
    }
    mapping (address => uint256) private _allowances;

    // IERC20's functions are not pure, but these mock implementations are: to prevent Solidity from issuing warnings,
    // we write to a dummy state variable.
    uint256 private _dummy;

    function transfer(address, uint256) public {
        _dummy = 0;
    }

    function transferFrom(address, address, uint256) public {
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
    uint256[48] private __gap;
}

contract SafeERC20WrapperUpgradeSafe is __Initializable, ContextUpgradeSafe {
    using SafeERC20UpgradeSafe for IERC20UpgradeSafe;

    IERC20UpgradeSafe private _token;

    function __SafeERC20Wrapper_init(IERC20UpgradeSafe token) internal __initializer {
        __Context_init_unchained();
        __SafeERC20Wrapper_init_unchained(token);
    }

    function __SafeERC20Wrapper_init_unchained(IERC20UpgradeSafe token) internal __initializer {
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

    function setAllowance(uint256 allowance_) public {
        ERC20ReturnTrueMockUpgradeSafe(address(_token)).setAllowance(allowance_);
    }

    function allowance() public view returns (uint256) {
        return _token.allowance(address(0), address(0));
    }
    uint256[49] private __gap;
}
