pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

contract Nftmarket is IERC721Receiver{
    address public token_addr;
    address public nft_addr;
    mapping(uint=>uint) token_list;

    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external override returns (bytes4){
        return ""; 
    }

    constructor(address _token_addr,address _nft_addr){
        token_addr=_token_addr;
        nft_addr=_nft_addr;
    }
    //上架

    function list(uint tokenid,uint amount) public {
        IERC721(nft_addr).transferFrom(msg.sender,address(this),tokenid);
        token_list[tokenid]=amount;

    }

    //buy
    function buy(uint tokenid,uint amount) external {
        require(token_list[tokenid] > amount,"price is low!");
        IERC20(token_addr).transferFrom(msg.sender,address(this),amount);
        IERC721(nft_addr).transferFrom(address(this),msg.sender,tokenid);
    }

}