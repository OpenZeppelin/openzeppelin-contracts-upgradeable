pragma solidity ^0.6.0;

import "../presets/ERC721PresetMinterPauserAutoId.sol";
import "../Initializable.sol";

contract ERC721PresetMinterPauserAutoIdMockUpgradeSafe is Initializable, ERC721PresetMinterPauserAutoIdUpgradeSafe {

    constructor(string memory name, string memory symbol, string memory baseURI) public payable {
        __ERC721PresetMinterPauserAutoIdMock_init(name, symbol, baseURI);
    }

    function __ERC721PresetMinterPauserAutoIdMock_init(string memory name, string memory symbol, string memory baseURI) internal initializer {
        __Context_init_unchained();
        __AccessControl_init_unchained();
        __ERC165_init_unchained();
        __ERC721_init_unchained(name, symbol);
        __ERC721Burnable_init_unchained();
        __Pausable_init_unchained();
        __ERC721Pausable_init_unchained();
        __ERC721PresetMinterPauserAutoId_init_unchained(baseURI);
        __ERC721PresetMinterPauserAutoIdMock_init_unchained(name, symbol, baseURI);
    }

    function __ERC721PresetMinterPauserAutoIdMock_init_unchained(string memory name, string memory symbol, string memory baseURI) internal initializer {



    }


    uint256[50] private __gap;
}
