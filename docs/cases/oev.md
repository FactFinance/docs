---
label: Oracle Extractable Value 
order: -9
icon: dependabot
---

# **Oracle Extractable Value (OEV)**

## **The Problem:**

Oracle Extractable Value (OEV) is a significant challenge in blockchain ecosystems, where oracles act as a bridge between off-chain data and smart contracts. Similar to Maximal Extractable Value (MEV), OEV arises when an oracle—or entities with privileged access to its data—can manipulate the order, timing, or accuracy of price updates for financial gain. This manipulation can lead to unfair advantages in decentralized finance (DeFi), compromising market integrity and user trust.

### **How OEV Occurs**
OEV happens when an oracle provider or an external actor leverages its access to price updates before they are reflected on-chain. This can lead to unfair liquidations, arbitrage, or market distortions. Key forms of OEV include:

- **Timing Manipulation:** Oracles may intentionally delay or accelerate price updates to create arbitrage opportunities.
- **Front-Running Liquidations:** Oracles can front-run undercollateralized positions before other users react.
- **Biased Data Submission:** Centralized oracles may provide manipulated or skewed data to benefit specific entities.
- **Exploiting Off-Chain Market Data:** Oracles with privileged access to market data may trade ahead of on-chain updates.

---

## **Protocols Affected by OEV**

| **Protocol Type**            | **Main OEV Risk**                                          |
|-----------------------------|------------------------------------------------------------|
| **Lending Platforms**       | Delayed or manipulated prices can trigger unfair liquidations. |
| **Decentralized Exchanges** | Oracles influencing price updates can lead to sandwich attacks or arbitrage. |
| **Prediction Markets**      | Manipulated data reporting can distort market outcomes. |
| **Stablecoins**             | Inaccurate collateral valuations can cause instability. |

---

## **Fact Finance’s Solutions to Mitigate OEV**
Fact Finance provides tailored solutions to mitigate the risks associated with OEV, ensuring fair and transparent data feeds for smart contracts. Our approach includes:

###  **DApp Oracle**
A decentralized oracle infrastructure that minimizes the risk of data manipulation by ensuring transparency in data aggregation and delivery.

###  **Commit-Reveal Mechanism**
A cryptographic technique that prevents frontrunning and pre-trade arbitrage by submitting hashed commitments before revealing actual data, making it impossible for attackers to anticipate price updates.

###  **Salt Solution for Secure Data Delivery**
By encrypting price updates with a unique salt value, Fact Finance ensures that data remains private until it is securely decrypted on-chain, preventing mempool-based exploits.

These mechanisms work together to provide a **secure, reliable, and tamper-resistant** data infrastructure that strengthens the DeFi ecosystem and protects users from OEV-related attacks.

## Contact 

Want to learn more about OEV or assess if your project is protected? Contact our audit team for a detailed evaluation and tailored recommendations.

Audit team projects@fact.finance :icon-codescan:
