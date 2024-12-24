---
label: Holidays
order: -2
icon: calendar
---

# Holiday

The Holiday feature is a simple yet practical functionality that highlights how blockchain applications increasingly rely on real-world data to operate efficiently. While it may seem like an innocent use case, this feature solves a very real problem for many protocols that require reliable and up-to-date information about bank holidays and business days.

# What It Does

The Holiday Oracle provides two core functionalities:

**Is It a Holiday?**
- The oracle verifies whether a specific date is a bank holiday in a given jurisdiction.
- This data can be used on-chain to trigger calculations that depend on working days (e.g., loan interest accrual or payment deadlines).

**Calculate Business Days**
- The feature includes an interface to calculate the number of working days (non-holidays) within a specified date range.
- This is particularly useful for financial protocols that need precise calculations for payment schedules or interest periods.

## Why It Matters

For many clients, especially in the financial sector, accurate business day data is critical to ensure the proper execution of smart contracts:

Lending Protocols
:	Calculate loan interest or repayment schedules based only on bank days.

Payment Systems
:	Ensure on-chain payments align with real-world business calendars, avoiding inaccuracies due to holidays.

DeFi Insurance
:	Determine valid claim dates by excluding holidays from the calculation.


## How It Works

### 1.Holiday Data Source:
Fact Finance integrates with reliable external sources, such as government or bank calendars, to provide accurate holiday data for specific regions.

### 2.On-Chain Verification:
The oracle makes this data available on-chain, enabling smart contracts to query:
- Whether a date is a holiday.
- The number of business days within a date range.

### 3.Custom Regions and Calendars:
Clients can request regional configurations, ensuring that calculations reflect the correct jurisdiction’s holiday calendar.

## Contact
Want to integrate this feature or need holiday data for your protocol? Join our experimental phase and explore how Fact Finance can help you bridge real-world business logic with blockchain efficiency! Contact us to get started.

Projects Team project@fact.finance
