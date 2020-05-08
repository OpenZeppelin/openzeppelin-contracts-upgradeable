pragma solidity ^0.6.0;

import '../presets/ERC20PresetMinterPauser.sol';

contract ERC20PresetMinterPauserMock is ERC20PresetMinterPauser {
    constructor (string memory name, string memory symbol) public payable ERC20PresetMinterPauser(name, symbol) {
    }
}
