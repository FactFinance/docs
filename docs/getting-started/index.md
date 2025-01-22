---
label: Fact Oracles
order: -100
icon: cache
expanded: false
---

# Introduction to Fact Oracle Services

The Fact Oracle offers a comprehensive suite of oracle solutions designed to meet diverse data requirements in blockchain-based applications. These solutions provide secure, accurate, and efficient access to real-world data, empowering smart contracts and decentralized applications (DApps) to function reliably. The Fact Oracle system includes three distinct types of services:

1. **Synchronous (Push) Oracle**
2. **Asynchronous (Pull) Oracle**
3. **DApp Oracle**

Each service type is tailored to specific use cases and workflows, ensuring flexibility and scalability for developers and users.

---

## 1. Synchronous (Push) Oracle
The Synchronous Oracle provides real-time data updates directly on-chain. Data feeds are periodically updated, allowing smart contracts to fetch the latest data without delays.

- **Use Case:** Ideal for applications requiring continuous access to on-chain data, such as economic indices and public metrics.
- **Integration:** Developers retrieve data using the `getSyncData` function in the Fact Oracle contract.

[/sync](/getting-started/sync/)

---

## 2. Asynchronous (Pull) Oracle
The Asynchronous Oracle operates on a request-response model. Users submit data requests, and responses are processed asynchronously, providing flexibility in handling complex or large-scale data queries.

- **Use Case:** Suitable for scenarios where data requests are specific or dynamic, such as weather information, real estate details, or car insurance data.
- **Integration:** Developers submit requests using the `requestAsyncData` function and process responses via `OracleDataCallback` or `OracleBytesCallback`.

[/async](/getting-started/async/)

---

## 3. DApp Oracle
The DApp Oracle combines the strengths of push and pull models in a hybrid solution. DApps interact directly with the Fact Finance API to request data, which is returned in a signed `DataPackage` for on-chain verification.

- **Use Case:** Designed for DApps requiring off-chain data integrity and on-chain validation, ensuring secure and transparent interactions.
- **Integration:** Developers request data from the API and validate it on-chain using the `verifyDappData` function.

[/dapp](/getting-started/dapp)

---

## Choosing the Right Oracle Solution
The choice of oracle depends on your application's specific needs:

- Choose **Synchronous Oracle** for real-time, continuously updated on-chain data.
- Opt for **Asynchronous Oracle** when handling specific or complex data requests.
- Use **DApp Oracle** for hybrid workflows requiring off-chain API interactions and on-chain verification.

By leveraging Fact Oracle’s tailored solutions, developers can build robust and secure blockchain applications that seamlessly interact with real-world data.

For more information, visit our documentation pages for each service or contact us at **projects@fact.finance**.

