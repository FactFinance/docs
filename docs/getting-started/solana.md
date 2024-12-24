---
label:  Solana SDK
order: -100
icon: code 
---

# Getting Started - Solana 

At Fact Finance, we're reshaping web3 infrastructure with tailored, reliable real-world data. By forging strategic partnerships with official data providers, including research institutes, sports leagues, and governmental data agencies, we empower businesses to confidently navigate regional nuances. Our commitment to education and sustainability ensures a lasting impact and growth, driving tangible progress in the digital landscape. Join us in revolutionizing web3’s future—one data point at a time.


## How to interact with Fact Oracle

The PayPerUseOracle contract allows users to access data feeds on a pay-per-use basis. It includes functions to check feed prices, request data, and verify signatures.

Example Usage:

```rust

#[program]
mod consumer {
    use super::*;

    // Function to pull data from the Oracle program
    pub fn pull_oracle(ctx: Context<PullOracle>) -> anchor_lang::Result<()> {   
        // Calling the CPI method to get data from the Oracle program     
        let result = oracle::cpi::get_datafeed(
            CpiContext::new(
                ctx.accounts.oracle_program.to_account_info(),                
                GetDataFeed {
                    datafeed: ctx.accounts.datafeed.to_account_info(),
                    subscribers: ctx.accounts.subscribers.to_account_info(),
                    signer: ctx.accounts.signer.to_account_info(),
                },
            ),             
        );

        // Unpacking the result tuple
        let (value, timestamp, confidence) = result?.get();

        // Logging the retrieved data
        msg!("consumer value {} and timestamp {} with confidence {} ", value, timestamp, confidence);

        Ok(())
    }
}
```


## Dappi Integration
You can use the three Oracles to request a feed verification returned from https://api.fact.finance.

    
## Installation

```bash
  git clone git@github.com:FactFinance/solana-fact-oracle.git
```

Then, install the dependencies:

```bash
  cd solana-fact-oracle
  npm install
```


Compile, deploy and Run:

```bash
    anchor build && anchor deploy && anchor run test
```


Automated Test 
  
    ✔ Initialize the oracle! (40ms)
    ✔ Set Value! (731ms)
    ✔ Set License! (809ms)
    ✔ Add subscription! (810ms)
    ✔ Pull the oracle! (404ms)
    ✔ Revoke subscription! (810ms)

## License

This project is licensed under the Apache License 2.0. 

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## Contact

For any questions or support, please contact us at support@fact.finance

## Be in touch
  - https://fact.finance
  - https://twitter.com/TheFactOracle


