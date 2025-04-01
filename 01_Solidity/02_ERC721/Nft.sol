// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
/*带有元数据(ERC721URIStorage)的NFT*/
contract MyNft is ERC721URIStorage{
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;


    constructor() ERC721("Lei", "Chen") {}

    // 最简单的铸造函数
    function mint(address to) public {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }


}

/*不带有元数据的NFT
contract SimpleNFT is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("SimpleNFT", "SNFT") {}

    // 最简单的铸造函数
    function mint(address to) public {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }

    // 获取当前总供应量
    function totalSupply() public view returns (uint256) {
        return _tokenIdCounter.current();
    }
}
*/