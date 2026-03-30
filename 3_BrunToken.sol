// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol"; 

contract BurnToken is ERC20, ERC20Burnable {
    constructor() ERC20("Fire Coin", "FIRE") {
        // 给老板发 100 万个初始代币
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }
}
