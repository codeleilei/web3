// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract Mytoken is ERC20{
    event Mint(address indexed _from, uint _amount);

    constructor(
        string memory name,
        string memory symbol,
        uint256 initialSupply
    ) ERC20(name, symbol) {
        _mint(msg.sender, initialSupply);
        emit Mint(msg.sender,initialSupply);
    }
}

/*
*
| 功能               | 简化版 | 完整版 |
|--------------------|--------|--------|
| 基础 ERC20 功能    | ✓      | ✓      |
| 代币销毁           | ✗      | ✓      |
| 暂停转账           | ✗      | ✓      |
| 权限管理           | ✗      | ✓      |
| 离线签名授权       | ✗      | ✓      |
| 代码复杂度         | 低     | 中     |


### 部署参数
部署时需要提供三个参数：
1. `name` - 代币名称（如 "My Simple Token"）
2. `symbol` - 代币符号（如 "MST"）
3. `initialSupply` - 初始供应量（如 1000000 * 10^18）

### 主要功能
1. **转账**：
   ```solidity
   function transfer(address to, uint256 amount) public returns (bool)
   ```

2. **授权其他地址使用你的代币**：
   ```solidity
   function approve(address spender, uint256 amount) public returns (bool)
   ```

3. **从授权账户转账**：
   ```solidity
   function transferFrom(address from, address to, uint256 amount) public returns (bool)

*/