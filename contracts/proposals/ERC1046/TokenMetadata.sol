pragma solidity ^0.4.21;

import "../../token/ERC20/ERC20.sol";
import "zos-lib/contracts/migrations/Migratable.sol";

/**
 * @title ERC-1047 Token Metadata
 * @dev See https://eips.ethereum.org/EIPS/eip-1046
 * @dev tokenURI must respond with a URI that implements https://eips.ethereum.org/EIPS/eip-1047
 * @dev TODO - update https://github.com/OpenZeppelin/openzeppelin-solidity/blob/master/contracts/token/ERC721/ERC721.sol#L17 when 1046 is finalized
 */
contract ERC20TokenMetadata is ERC20 {
  function tokenURI() external view returns (string);
}


contract ERC20WithMetadata is Migratable, ERC20TokenMetadata {
  string private tokenURI_ = "";

  function initialize(string _tokenURI)
    public
    isInitializer("ERC20WithMetadata", "1.11.0")
  {
    tokenURI_ = _tokenURI;
  }

  function tokenURI() external view returns (string) {
    return tokenURI_;
  }
}
