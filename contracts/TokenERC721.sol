//Contract based on [https://docs.openzeppelin.com/contracts/3.x/erc721](https://docs.openzeppelin.com/contracts/3.x/erc721)
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract ArtCcNFT is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    mapping(string => uint8) hashes;

    address private marketplaceAddress;

    constructor(address _marketplaceAddress) ERC721("ArtCcNFT", "Art NFT") {
        marketplaceAddress = _marketplaceAddress;
    }

    function mintToken(address recipient, string memory hash, string memory metadata)
        public onlyOwner
        returns (uint256)
    {
        require(hashes[hash] != 1);
        hashes[hash] = 1;

        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();

        _mint(recipient, newItemId);
        _setTokenURI(newItemId, metadata);

        setApprovalForAll(marketplaceAddress, true);

        return newItemId;
    }

    
}
