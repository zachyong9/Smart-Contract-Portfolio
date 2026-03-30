// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// 导入国际标准的代币合约库
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    // 构造函数：在你部署的那一刻，给自己发 100 万个币
    // 参数1：代币名称 (例如: Gemini Pro Token)
    // 参数2：代币符号 (例如: GPT)
    constructor() ERC20("Gemini Pro Token", "GPT") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }
}
