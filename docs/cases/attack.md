---
label: Oracle Attacks
order: -9
icon: alert
---

# What is an Oracle Attack?

An oracle attack occurs when an oracle, the critical bridge between off-chain data and on-chain smart contracts, is exploited, manipulated, or compromised. Since oracles provide the external data that smart contracts rely on, an attack on the oracle can lead to incorrect decisions, financial losses, or even the collapse of decentralized systems.

Oracles are a key component of many blockchain applications, including decentralized finance (DeFi), and their security is crucial for maintaining trust and reliability. Oracle attacks exploit vulnerabilities in the data sourcing, transmission, or governance mechanisms of the oracle.

Types of Oracle Attacks
### Price Manipulation:
Description: An attacker manipulates the price data provided by an oracle to cause an artificial change in asset values, resulting in unintended consequences for smart contracts.
>Example: In a lending protocol, the attacker artificially inflates the price of a low-liquidity asset used as collateral. The manipulated price enables the attacker to borrow large amounts of stablecoins, leaving the protocol with undercollateralized loans.

### Flash Loan Exploits:
Description: An attacker uses a flash loan (a short-term loan with no collateral requirement) to manipulate on-chain liquidity or pricing, causing the oracle to report incorrect values.
>Example: The attacker borrows a large amount of an asset through a flash loan, pumps its price temporarily on a decentralized exchange, and exploits the inflated price for arbitrage or liquidation.

### Single Source of Truth:
Description: Oracles relying on a single data source can be manipulated if that source is compromised or provides incorrect data.
>Example: An oracle relying on a single centralized exchange for price data could be exploited if the attacker manipulates the exchange’s order book.

### Sybil Attacks:
Description: In decentralized oracle networks, an attacker creates multiple identities to gain control over the majority of the data input.
>Example: A malicious actor launches multiple fake nodes in a decentralized oracle network and colludes to report false data, compromising the integrity of the oracle.

### Data Delay Exploits:
Description: An attacker exploits delays in oracle updates, using outdated data to manipulate smart contract operations.
>Example: A lending protocol uses an oracle with delayed updates. The attacker exploits this by taking advantage of sudden market changes not yet reflected in the oracle data.

### Compromised Oracle Operators:
Description: A centralized oracle operator is bribed, coerced, or hacked, leading to the submission of false data.
>Example: A malicious party bribes a centralized oracle operator to report a manipulated price for an asset, enabling fraudulent trades or loans.

### DNS Hijacking:
Description: An attacker hijacks the domain of a web-based API used by an oracle, causing it to feed manipulated data.
>Example: An attacker redirects oracle requests to a malicious server that provides falsified data about asset prices or external events.

##  Oracle Attacks Disclosed
=== bZx Protocol Attack :
What Happened: An attacker used a flash loan to manipulate the price of wBTC (wrapped Bitcoin) on an oracle, allowing them to borrow undercollateralized assets from the bZx protocol.
Impact: The protocol lost approximately $due to the exploit.

=== Synthetix Oracle Manipulation:
What Happened: An attacker manipulated the price feed for Korean Won (KRW) on Synthetix by exploiting a vulnerability in a single-source price oracle.
Impact: The attacker gained an estimated $billion in synthetic assets, although the issue was resolved by the Synthetix team.

=== Harvest Finance Exploit :
What Happened: An attacker used flash loans to manipulate the price of a stablecoin reported by a Curve pool oracle, leading to arbitrage that drained $ million from the protocol.
Impact: Harvest Finance suffered significant financial losses and user trust issues.
Compound Oracle Issue :
=== What Happened: A price oracle misreported the value of stETH (staked Ethereum), causing overcollateralized loans to become vulnerable to liquidation.
Impact: Several users lost collateral due to false liquidation triggers.
===

## Mitigating Oracle Attacks
**Decentralized Oracle Networks:**
Use multiple independent data sources and aggregators to avoid single points of failure.
>Example: Chainlink aggregates data from multiple providers, reducing the likelihood of manipulation.

**Data Aggregation and Verification**
Cross-check data from multiple sources and use weighted averages to mitigate outliers or manipulated prices.
>Example: Using data from multiple exchanges to calculate asset prices.

**Time-Weighted Data Feeds**
Implement time-weighted price averages (TWAP) to smooth out short-term price manipulation.
>Example: Uniswap Voracles calculate TWAP based on block intervals.

**Off-Chain Security Audits**
Regularly audit APIs, oracles, and smart contracts to identify vulnerabilities.
>Example: Engaging third-party firms to audit oracle integrations and API sources.

**Monitoring Flash Loan Activity**
Monitor and restrict unusual flash loan activity to prevent rapid manipulation.
>Example: Implementing flash loan protection mechanisms to flag suspicious transactions.

**Slashing and Staking Mechanisms**
In decentralized oracle networks, penalize nodes for providing inaccurate data and reward honest reporting.
>Example: Chainlink’s staking mechanism incentivizes accurate data provision.

## Why Oracle Security Matters

Oracles are the backbone of DeFi, stablecoins, lending protocols, and tokenized assets. Securing them is vital to ensure:

   |    
---|---
Trust |Preventing manipulation maintains the credibility of decentralized systems.
Fairness | Eliminating opportunities for malicious actors protects user assets and protocol functionality.
Scalability | Strong oracle security encourages adoption of blockchain-based financial systems by reducing systemic risks.

## Contact 
At Fact Finance, we adopt robust security mechanisms and work closely with projects to implement best practices for mitigating oracle vulnerabilities.

Want to learn more about oracle attacks or assess whether your project is vulnerable? Get in touch with our audit team for a comprehensive evaluation and tailored recommendations.

Audit team projects@fact.finance :icon-codescan:
