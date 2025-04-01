// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Bank {

    mapping (address => uint256 ) public userDeposits;

    event Deposit(address indexed user, address indexed token, uint256 amount);
    event Withdraw(address indexed user, address indexed token, uint256 amount);

    function getUserDeposits(address _owner)public view returns (uint){  return userDeposits[_owner];  }

    function deposite(address tokenAddress,uint amount) external  {
        require(amount > 0,"amount Must big than 0");
        bool success = IERC20(tokenAddress).transferFrom(msg.sender,address(this),amount);
        require(success,"transform faild");

        userDeposits[msg.sender] += amount;

        emit Deposit(msg.sender, tokenAddress, amount);

    }

    function withdraw(address tokenAddress, uint256 amount) external  {
        require(amount > 0,"amount must big than 0");
        require(userDeposits[msg.sender] >= amount,"Insufficient balance");

        userDeposits[msg.sender] -=amount;
        // 从Bank合约转账回用户
        bool success = IERC20(tokenAddress).transfer(msg.sender, amount);
        require(success,"");
        emit Withdraw(msg.sender, tokenAddress, amount);

    }

        // 查询用户存款余额
    function getDepositBalance() external view returns (uint256) {
        return userDeposits[msg.sender];
    }

}