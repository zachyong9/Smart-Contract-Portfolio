// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract MyContractV2 is Initializable, UUPSUpgradeable, OwnableUpgradeable {
    uint256 public data;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    // V2 不需要重新 initialize，状态会保留

    // 新增的功能：修改 data 的值
    function changeData(uint256 _newData) public {
        data = _newData;
    }

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}
}
