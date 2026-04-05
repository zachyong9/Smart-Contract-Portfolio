// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract MyContractV1 is Initializable, UUPSUpgradeable, OwnableUpgradeable {
    uint256 public data;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers(); // 保护逻辑合约不被恶意初始化
    }

    // 替代 constructor 的初始化函数
    function initialize(address initialOwner) initializer public {
        __Ownable_init(initialOwner);
        data = 100; // 初始状态数据设为 100
    }

    // UUPS 核心：授权升级，只有 Owner 可以执行
    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}
}
