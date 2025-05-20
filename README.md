<marquee><h1>🚀 Chainlink Solidity Bootcamp Projects</h1></marquee>

This repository showcases the three smart contracts I built during a hands-on **Chainlink Solidity Bootcamp**.  
The bootcamp spanned **3 days**, each focused on a different Solidity/Chainlink use case, from NFTs to staking to CCIP-based cross-chain tokens.

---

## 📅 Bootcamp Breakdown

### 🖼️ Day 1: BloomsCollection — Simple NFT Minting
- Built using OpenZeppelin's **ERC721** and **ERC721URIStorage**.
- `safeMint()` allows the contract owner to mint NFTs with a default or custom IPFS URI.
- Uses a simple auto-incrementing token ID system.
- Ideal for showcasing a collection of digital art pieces.
  
📁 [`/Day1-NFT`](./Day1-NFT)

---

### 💰 Day 2: DynamicStake — Chainlink-Powered Staking
- A dynamic staking contract where rewards are calculated based on **real-time ETH/USD price** using Chainlink Data Feeds.
- Accepts ERC20 tokens, requires approval before staking.
- Reward rate is calculated per minute, dynamically adjusting based on ETH price.
- Uses a `mint()` function on the ERC20 token to issue staking rewards.

Key features:
- Live price integration via `AggregatorV3Interface`
- Reward auto-claim on stake, unstake, and manual claim

📁 [`/Day2-Staking`](./Day2-Staking)

---

### 🌉 Day 3: MyToken — CCIP-Compatible Cross-Chain ERC20
- Custom ERC20 token contract using OpenZeppelin + Chainlink CCIP interfaces.
- Includes `MINTER_ROLE` and `BURNER_ROLE` access control for on-chain governance.
- Admin can assign mint/burn rights to specific roles.
- Ready for integration with Chainlink's **Cross-Chain Interoperability Protocol (CCIP)** via `s_CCIPAdmin`.

📁 [`/Day3-CCIP`](./Day3-CCIP)

---

## 🔧 Tech Used

- **Solidity** `^0.8.x`
- **OpenZeppelin Contracts** `v5.x`
- **Chainlink Data Feeds**
- **Chainlink CCIP Interfaces**
- **Remix IDE** (Day 1)
- **Custom ERC20 + AccessControl**
