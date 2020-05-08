pragma solidity ^0.6.0;

import '../presets/ERC721PresetMinterPauserAutoId.sol';

contract ERC721PresetMinterPauserAutoIdMock is ERC721PresetMinterPauserAutoId {
    constructor (string memory name, string memory symbol, string memory baseURI) public payable ERC721PresetMinterPauserAutoId(name, symbol, baseURI) {
    }
}
