---
label: Data Feeds 
order: -105
icon: rows
---

# Data Feeds

The Fact Finance Oracle provides reliable and diverse data feeds to support a wide range of decentralized applications (DApps). Our data feeds are categorized into three key areas:

## Economic Data:
Includes indicators such as Consumer Price Index (CPI), interest rates, and foreign exchange (forex) rates. These data points are essential for stablecoins, lending protocols, and financial forecasting.

+++ Brazil
Data Feed | FeedId | Description | Source
---|---
CDI | `1001` | Interbank Deposit Certificate | Central Bank
Selic | `1002` | Special System for Settlement and Custody | Central Bank
IGP-M | `1003` |  General Market Price Index | IBRE
USD-BRL | `1100` | PTax - Reference Exchange Rate | Central Bank
CDI Daily| `1101` | CDI Daily | Central Bank


==- Details
**CDI** - The CDI (Interbank Deposit Certificate) is an index that measures the interest rate used for loans between banks in Brazil, serving as a benchmark for fixed-income investments. 
- Decimal: 2
- Update Frequency: Monthly
- License: Open Oracle
- Interface: Pull, Push and DApp

**Selic** - It refers to the system used by the Central Bank of Brazil to manage the trading of government securities and essentially acts as the benchmark interest rate for the Brazilian economy
- Decimal: 2
- Update Frequency: Monthly
- License: Open Oracle
- Interface: Pull, Push and DApp

**IGP-M** - The General Market Price Index, expressed in index points, with a base value of 100 in August 1994, calculated by the Brazilian Institute of Economics (IBRE) of the Getulio Vargas Foundation (FGV). 
- Decimal: 2
- Update Frequency: Monthly
- License: Open Oracle
- Interface: Pull, Push and DApp

**USR-BRL** - The PTAX dollar is the exchange rate calculated by the Central Bank of Brazil based on the average buying and selling rates of the dollar in the interbank market. It is widely used as a reference for contracts and financial operations
- Decimal: 4
- Update Frequency: Daily
- License: Open Oracle
- Interface: Pull, Push and DApp

 **CDI Daily** - The CDI (Interbank Deposit Certificate) is an index that measures the interest rate used for loans between banks in Brazil, serving as a benchmark for fixed-income investments. 
- Decimal: 6
- Update Frequency: Daily
- License: Open Oracle
- Interface: Pull, Push and DApp
===

+++ Argentina
Data Feed | Code | Description | Source
---|---
USD-ARS | `1101` | Forex| Central Bank
CPI | `1102` | Consumer Price Index | Central Bank

==- Details
**USR-ARS** - Online Forex 24/7
- Decimal: 4
- Update Frequency: Change 0.1%
- License: Open Oracle
- Interface: Pull, Push and DApp
===

+++ Latin America
Data Feed | Code | Description | Source
---|---
USD-BOB | `1201` | Bolivian Boliviano| Onchain
USD-CLP | `1203` | Chilean Peso| Onchain
USD-COP | `1204` | Colombian Peso| Onchain
USD-MXN | `1205` | Mexican Peso| Onchain


==- Details
**ALL Latam** - Online Forex 24/7
- Decimal: 4
- Update Frequency: Change 0.1%
- License: Open Oracle
- Interface: Pull, Push and DApp
===

+++


## Commodities Data:
Tracks real-time prices of gold, silver, oil, and other commodities. Ideal for tokenization platforms, synthetic assets, and trade finance applications.

## Real Estate Data:
Provides valuation and property-related data for residential and commercial assets. Supports tokenization platforms and lending protocols relying on real-world asset collateral.


## Data request
If you haven’t found the specific data you need, please get in touch with us! We are happy to explore your requirements and provide tailored solutions to meet your needs. 

Data Team at data@fact.finance
