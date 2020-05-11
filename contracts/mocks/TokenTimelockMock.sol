pragma solidity ^0.6.0;

import '../token/ERC20/TokenTimelock.sol';

contract TokenTimelockMock is TokenTimelock {
    constructor (IERC20 token, address beneficiary, uint256 releaseTime) TokenTimelock(token, beneficiary, releaseTime) public {
    }
}
