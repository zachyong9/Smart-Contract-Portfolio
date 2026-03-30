// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol"; // 引入权限控制库 (Permission Control)

contract TaxToken is ERC20, Ownable {
    uint256 public taxRate = 5; // Tax rate (税率): 5%
    address public taxWallet;   // Tax wallet (收税钱包)

    // Constructor (构造函数)
    constructor() ERC20("Tax Token", "TAX") Ownable(msg.sender) {
        taxWallet = msg.sender; // 把部署合约的人设为收税钱包
        _mint(msg.sender, 1000000 * 10 ** decimals()); // Mint (铸造) 100万个代币
    }

    // 重写底层的转账逻辑 (Override transfer logic)
    // 这是核心部分：拦截每次转账，从中扣税
    function _update(address from, address to, uint256 value) internal virtual override {
        // 如果是凭空铸造 (Mint) 或销毁 (Burn)，不收税
        if (from == address(0) || to == address(0)) {
            super._update(from, to, value);
            return;
        }

        // Calculate tax (计算税费)
        uint256 taxAmount = (value * taxRate) / 100;
        uint256 amountAfterTax = value - taxAmount;

        // 执行两笔转账 (Execute two transfers)
        super._update(from, taxWallet, taxAmount); // 1. 把税费打给收税钱包
        super._update(from, to, amountAfterTax);   // 2. 把剩下的钱打给接收方
    }
