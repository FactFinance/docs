---
label: Proof of Reserve - Real Estate
order: -6
icon: project-roadmap
visibility: private
---

**Bringing trust and transparency to real estate tokenization**  
Fact Finance provides a robust Proof-of-Reserves (PoR) framework designed specifically for real estate tokenized assets. By verifying the ownership, valuation, and existence of underlying properties, our solution ensures asset-backed tokens are credible, auditable, and transparent.

---

## **How It Works**

### **1. Off-Chain Validation**  
We begin with the rigorous validation of real estate assets in the physical world, ensuring the accuracy, ownership, and current valuation:  

- **Data Collection**:  
   - Trusted sources:  
     - **Property Registries** (e.g., land title offices, government databases).  
     - **Valuation Reports** from certified appraisers.  
     - **Audits** by independent real estate firms.  
   - Documents include:  
     - Property ownership deeds.  
     - Recent property valuation certificates.  
     - Legal status and encumbrance details.  


- **Data Verification**:  
   - **Ownership Confirmation**: Ensuring legal ownership through verified deeds.  
   - **Valuation Validation**: Cross-check appraisals with market prices, rental yields, and local property indices.  
   - **Encumbrance Check**: Identifying liens, mortgages, or other claims against the property.  

- **Cryptographic Signing**:  
   - Once verified, all data is signed using cryptographic keys by the trusted data provider to guarantee **authenticity** and **immutability**.  

---

### **2. On-Chain Integration**  
Validated real estate data is seamlessly published on-chain for transparency and accessibility:  

- **Structured On-Chain Data**:  
   - Property Details:  
      - Ownership information (hashed for privacy).  
      - Valuation and timestamp of appraisal.  
      - Legal status (e.g., encumbrances, liens).  
   - Proof-of-Reserves Certificate:  
      - Digitally signed by the verifier.  
      - Stored immutably on-chain.  
   - Cryptographic Proof: Ensuring no tampering or manipulation.  

- **Onboarding Process**:  
   - Fact Finance Oracle validates and publishes the cryptographically signed reserve data on-chain.  
   - A unique **PoR certificate** is generated and tied to the tokenized real estate asset.  

- **Real-Time Updates**:  
   - Regular audits and updates keep PoR certificates current, ensuring tokens remain backed by verified reserves.  

---

## **Key Data Points Provided by the Oracle**  

1. **Property Identification**  
   - Unique Asset ID (e.g., land registry number or digital token ID).  
   - Location: Country, city, and specific address (hashed for privacy if needed).  

2. **Ownership Details**  
   - Verified legal owner (with cryptographic proof).  
   - Date of last ownership validation.  

3. **Valuation**  
   - Most recent property value, validated by certified appraisers.  
   - Timestamp of valuation.  

4. **Legal Status**  
   - Encumbrances: Information about liens, mortgages, or outstanding claims.  
   - Clean title verification.  

5. **Liquidity and Market Data**  
   - Recent comparable sales (local property prices).  
   - Rental yield, if applicable.  

6. **Cryptographic Proof**  
   - Hash of the verified data package.  
   - Signature of the third-party validator/auditor.  

---

## **Use Cases for Real Estate Proof-of-Reserves**  

- **Tokenized Real Estate Funds**:  
   - Verify the existence, ownership, and valuation of properties backing fractionalized tokens.  

- **Collateral for Lending Protocols**:  
   - Ensure that tokenized real estate used as collateral is backed by verifiable properties with current valuations.  

- **Investor Audits**:  
   - Investors can independently verify PoR certificates on-chain for full transparency.  

- **Decentralized Exchanges (DEXs)**:  
   - Validate that real estate-backed tokens traded on DEXs are backed by genuine, physical assets.  

---

## **Contact Us**  
Ready to integrate Proof-of-Reserves for your tokenized real estate project?  
📧 **Contact the Fact Finance Team**: projects@fact.finance
