# 🛡️ Enterprise-Grade ERC20 & UUPS Upgradeable Smart Contract Suite

Production-ready Solidity smart contract templates built with **OpenZeppelin**. This repository provides modular tokenomics implementations and an enterprise-grade **UUPS (Universal Upgradeable Proxy Standard)** proxy architecture for Web3 startups and DeFi protocols.

## 📂 Repository Structure & Templates

### 1. Modular ERC20 Tokenomics
- **`1_BasicToken.sol`**: Standard, gas-optimized ERC20 token implementation.
- **`2_TaxToken.sol`**: Custom ERC20 token with automated transfer tax logic (ideal for project treasury, marketing, or liquidity pool fee distribution).
- **`3_BrunToken.sol`**: Deflationary ERC20 token featuring token burn mechanisms to reduce total supply over time.

### 2. UUPS Upgradeable Architecture
- **`Proxy.sol`**: ERC1967 Proxy contract that holds the state and delegates calls to the logic layer.
- **`V1.sol` (`MyContractV1`)**: Initial upgradeable implementation contract with role-based access control and initializer.
- **`V2.sol` (`MyContractV2`)**: Upgraded logic layer demonstrating seamless state preservation and new function integration (`changeData`).

## ✨ Key Features
- **UUPS Proxy Pattern**: Upgrade contract logic safely from V1 to V2 while keeping the exact same contract address and user balances.
- **Custom Tokenomics Ready**: Pre-built templates for Tax (fee-on-transfer) and Burn (deflationary) mechanisms.
- **Security Best Practices**: Built on OpenZeppelin standards with strict ownership and upgrade authorization.

## 🚀 Quick Deployment Guide
1. **For Standard/Tax/Burn Tokens**: Deploy `1_BasicToken.sol`, `2_TaxToken.sol`, or `3_BrunToken.sol` directly via Remix IDE or Hardhat.
2. **For Upgradeable Contracts**:
   - Step 1: Deploy `V1.sol` (Implementation layer).
   - Step 2: Deploy `Proxy.sol` pointing to the `V1` address and initialize the state.
   - Step 3: To upgrade, deploy `V2.sol` and call the upgrade function via the Proxy address.

## 📬 Hire Me for Custom Web3 Development
I specialize in Solidity smart contract development, custom tokenomics, UUPS proxy architectures, and DApp front-end integration (Next.js / Wagmi). Feel free to reach out for freelance inquiries!
