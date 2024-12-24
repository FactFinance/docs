---
label: Confidence Index
order: -1
icon: check
---

# Confidence Index 

The Fact Finance Oracle Confidence Index is a methodology designed to classify data feeds provided by the oracle based on statistical and density-based anomaly detection techniques. The system evaluates incoming values against historical trends using the standard deviation and the Local Outlier Factor (LOF). These combined methods allow protocols to assess the reliability of the data and automate decision-making efficiently.

## How It Works

The methodology categorizes values into three tiers based on their statistical deviation and density-based scores:
1. **Reliable**
- Data points that fall within standard deviation of the historical mean. These values are considered highly stable and reliable.

- Formula:

$$
\displaystyle \sigma = \sqrt{\frac{\sum_{i=1}^n (x_i - \bar{x})^2}{n}}
$$

2. **Acceptable:**
- Data points that fall between and standard deviations of the mean. These values suggest mild volatility but are still within an acceptable range for most protocols.
- Formula:

$$
\bar{x} - 2\sigma \leq x \leq \bar{x} + 2\sigma
$$
￼
Data points in this range are flagged as acceptable for further use, but protocols are encouraged to take precautions, such as increasing spreads or adjusting collateral.

3. **Outlier:**
- Data points identified as anomalies based on the Local Outlier Factor (LOF) algorithm. LOF is a density-based method that measures how isolated a point is relative to its neighbors.
- Formula (LOF):
The LOF score of a point $\displaystyle \left( p \right)$ is calculated as:

$$
\displaystyle LOF(p) = \frac{\sum_{o \in N_k(p)} \frac{lrd(o)}{lrd(p)}}{|N_k(p)|}
$$


$$
\displaystyle lrd(p) = \frac{|N_k(p)|}{\sum_{o \in N_k(p)} reach\_dist_k(p, o)}
$$

$$
\displaystyle reach\_dist_k(p, o) = \max\{d(p, o), k\text{-dist}(o)\}
$$
￼
￼
## Objective of the Confidence Index

The primary goal of the Confidence Index is to help protocols that utilize the Fact Finance Oracle efficiently automate the handling of data feeds based on their reliability classification. This minimizes risk exposure and enhances operational robustness.

## Use Cases and Examples

### Stablecoins
Scenario: Stablecoins rely on oracle price feeds to maintain their peg to fiat currencies.

Implementation:

- **Acceptable (2)**: When data is classified as “Acceptable,” it indicates market volatility. The stablecoin protocol can increase the spread for swaps to mitigate slippage risk.

- **Outlier (3)**: When data is flagged as an “Outlier” (using LOF), the stablecoin protocol can halt swaps temporarily to avoid using manipulated or unreliable price feeds.

>Outcome: Maintained stability and prevention of cascading failures during market volatility.

### Lending Protocols
Scenario: Lending protocols rely on asset price feeds to manage collateralized loans.

Implementation:

- **Acceptable (2):** When a price feed is “Acceptable,” the protocol can reduce the Loan-to-Value (LTV) ratio to hedge against potential price inaccuracies.
- **Outlier (3):** If a price feed is flagged as an “Outlier,” the lending protocol can reject loan requests or trigger partial liquidations for safety.
>Outcome: Enhanced collateral management and reduced risk of bad debt.

### Tokenization Platforms
Scenario: Tokenization platforms depend on oracles for accurate valuations of tokenized real-world assets (RWAs).

Implementation:

- **Acceptable (2):** When data is classified as “Acceptable,” the platform may delay updates to the token valuation until further verification.
- **Outlier (3):** If flagged as an “Outlier,” asset trading can be temporarily paused for manual review.
>Outcome: Accurate valuations and prevention of faulty token issuance.

### Decentralized Exchanges (DEXs)
Scenario: DEXs use price oracles to set asset prices for liquidity pools.

Implementation:

- **Acceptable (2):** During mild volatility, a DEX can increase slippage tolerance or dynamic fees to reduce arbitrage risks.
- **Outlier (3):** If a price is flagged as an outlier, the DEX can pause trades or fallback to a secondary data source.
>Outcome: Mitigation of price manipulation and front-running exploits.

### Insurance Protocols
Scenario: Insurance protocols trigger payouts based on oracle data.
Implementation:
- **Acceptable (2):** For “Acceptable” data, protocols can request a secondary confirmation to validate the claim.
- **Outlier (3):** If flagged as an outlier, the payout can be put on hold for further verification.
>Outcome: Prevention of false claims and exploitation.

##  Benefits 
   |   
---|---
Automation | Enables protocols to automate responses based on data classifications.
Risk Management | Reduces exposure to unreliable or manipulated data.
Precision | Combines statistical analysis and LOF for robust anomaly detection.
Scalability | Adapts seamlessly to a variety of protocols, ensuring efficient risk handling.

### Conclusion
The Fact Finance Oracle Confidence Index provides a robust, automated approach to assess data reliability. By combining standard deviation analysis and Local Outlier Factor (LOF), the index empowers protocols to maintain stability, trust, and operational efficiency in dynamic blockchain environments.
