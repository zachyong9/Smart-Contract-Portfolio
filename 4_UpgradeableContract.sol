// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract MyContractV1 is Initializable, UUPSUpgradeable, OwnableUpgradeable {
    
    uint256 public secretValue;

    // 初始化函数 (V5 最新兼容版)
    function initialize() initializer public {
        __Ownable_init(msg.sender); // 依然需要确立你是老板
        // 注意：这里删除了 __UUPSUpgradeable_init(); 因为新版本不需要了！
        
        secretValue = 100; // V1 版本的核心逻辑：值为 100
    }

    // 安全锁：只有老板才能升级
    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}
}
