---
label: Proof of Reserve
order: -5
icon: repo-locked
---

# Proof-of-Reserves (PoR)

Proof-of-Reserves (PoR) mechanisms are used to verify the existence and integrity of asset reserves tied to blockchain systems. They are classified based on the audit methods and the nature of the reserves being validated. Here are the main types of PoR:

## Application 
==- 1. Proof-of-Custody
Verifies that physical assets (such as gold or cash) are under the custody of the responsible entity.
>Example: Gold-backed stablecoins where it is necessary to prove that the metal is stored in audited vaults.

==- 2. Proof-of-Balance
Confirms that funds held in a specific digital wallet match the tokens issued.
>Example: Exchanges proving they hold enough crypto assets to cover customer balances.

==- 3. Proof-of-Audit
Relies on third-party audits conducted by trusted firms to validate reserves.
>Example: Companies hiring auditors to verify the collateral backing stablecoins or other assets.

==- 4.Proof-of-Ownership
Demonstrates that the entity has full control over the declared assets, whether physically or in a digital wallet.
>Example: Exchanges or financial institutions proving they have access to the private keys of a crypto reserve.

==- 5.Proof-of-Solvency
Combines reserves with liabilities, proving that an entity is solvent and capable of covering all obligations.
>Example: Exchanges showing that their assets are equal to or greater than their liabilities to customers.

==- 6.Proof-of-Transparency
Uses public records (on-chain or off-chain) to validate the existence and movement of reserves.
>Example: Stablecoins publishing real-time reserve inflows and outflows.

==- 7.Proof-of-Liabilities
Focuses on demonstrating all financial obligations of an entity to ensure compatibility with its reserves.
>Example: DeFi protocols proving the total amount of debt and collateral in their systems.

==- 8.Proof-of-Asset (PoA)
Ensures that tokenized on-chain assets correspond to real-world assets.
>Example: Tokenized real estate where PoR validates the physical property’s existence and registration.

==- 9.Proof-of-Stake Reserves
Demonstrates that staking funds in a Proof-of-Stake (PoS) consensus protocol are secure and match the promised value.
>Example: Validation of staking pools for networks like Ethereum.

==- 10.On-Chain Proof-of-Reserves
Validates reserves in a fully transparent and auditable way directly on the blockchain.
>Example: Protocols publishing reserves in smart contracts for public audits.

=== 

## How It Works

The Proof-of-Reserve (PoR) process at Fact Finance is designed to deliver trust, transparency, and security to Web3 ecosystems. It integrates off-chain validation, an efficient onboarding process, and seamless on-chain accessibility for Web3 protocols. Below is an overview of how the system works:

## 1. Off-Chain Data Validation

The process begins with the off-chain validation of reserves to ensure data accuracy and credibility. This step focuses on gathering, verifying, and certifying data from trusted sources:
### Data Collection:
- Fact Finance partners with banks, auditing firms, vault custodians, and other reputable institutions to access reserve information.
- Sources include bank statements, physical vault reports, audit certificates, and digital wallet balances.
### Data Verification:
Fact Finance performs a rigorous validation process, including:
- Third-Party Audits: Independent verification of the provided reserves.
- Cross-Reference Checks: Comparison of reserve data with external market indicators and internal checks for inconsistencies.
- Contextual Analysis: Ensuring the reserve data aligns with economic factors such as interest rates, foreign exchange rates, and inflation.

### Cryptographic Signing:
Once verified, the reserve data is digitally signed by the data provider using a unique cryptographic key, ensuring the integrity and authenticity of the information.

## 2. Onboarding Process

The validated reserve data undergoes an onboarding process to prepare it for on-chain publication:
### Data Preparation:
- Fact Finance formats the reserve data into structured packages. Each package includes:
- Reserve details (e.g., balances, assets, or liabilities).
- Timestamp of validation.
- Cryptographic signature from the data provider.

### On-Chain Publication:
- The signed reserve data is submitted to the Fact Finance Oracle, which validates the cryptographic signature and publishes the data on-chain.
- A Proof-of-Reserve certificate is generated and stored on the blockchain, ensuring full transparency and immutability.

### Periodic Updates:
- Reserves are regularly audited and updated to reflect real-time conditions, ensuring up-to-date proof and continuous trust in the data.

## 3. Web3 Protocols Reading PoR

Once the PoR data is available on-chain, Web3 protocols can seamlessly integrate it to increase token acceptance and improve transparency for their users:
### Stablecoins:
- Stablecoin projects can reference on-chain PoR data to prove their collateralization levels.
> Example: A USDC-like stablecoin uses PoR to verify its fiat reserves, boosting user confidence in its peg.

### Lending Protocols:
- Lending platforms can read PoR to confirm the reserves of collateral-backed tokens before allowing loans.
>A tokenized gold-backed loan requires on-chain proof of physical reserves before approving the asset as collateral.

### Tokenization Platforms:
- Projects tokenizing real-world assets (RWAs) can use PoR data to validate ownership and existence of the underlying assets.
>A tokenized real estate fund displays on-chain PoR certificates to verify ownership and valuation of its properties.

### Decentralized Exchanges (DEXs):
- DEXs can integrate PoR data to ensure assets traded on their platform are fully backed and credible.
>A gold-backed token listed on a DEX is validated against its on-chain proof of reserves.

### Auditability for Investors:
- Investors and end-users can independently verify reserves through on-chain PoR certificates, increasing transparency and trust in asset-backed tokens.

## Why It Matters

The Fact Finance Proof-of-Reserve process bridges the gap between off-chain verification and on-chain transparency, providing Web3 protocols with the tools needed to ensure:

Trust
:	Assets are backed by real reserves validated through trusted processes.

Transparency
:	All data is verifiable on-chain, ensuring accountability.

Adoption
:	Increased investor and user confidence drives wider token acceptance.

## Contact 
Ready to integrate Proof-of-Reserve into your project? Partner with Fact Finance to deliver trusted, on-chain proof of your reserves and increase the acceptance and credibility of your tokens.

Projects Team projects@fact.finance
