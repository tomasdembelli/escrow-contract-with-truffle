# escrow-contract-with-truffle
Ethereum smart contract with truffle/solidity.

Based on [Ethereum: Building Blockchain Decentralized Apps](https://www.linkedin.com/learning/ethereum-building-blockchain-decentralized-apps-dapps) Linkedn learning course.

## Ethereum/Solidity
- Pure functions: They don't (should not) read or modify the state. See this [example](https://www.tutorialspoint.com/solidity/solidity_pure_functions.htm). They don't cost gas, there is a [caveat](https://ethereum.stackexchange.com/questions/52885/view-pure-gas-usage-cost-gas-if-called-internally-by-another-function).

- Ethereum Virtual Machine (EVM) does not compile source code. It only parses byte code. So, compile your contract before deploying it.

- Solidity [cheatsheet](https://docs.soliditylang.org/en/v0.8.7/cheatsheet.html).

## Development Set-up
- [Truffle](https://www.trufflesuite.com/docs/truffle/overview): Development environment for EVM.
- [Ganache](https://www.trufflesuite.com/ganache): Blockchain for Ethereum.
- Run Ganache: `chmod a+x ganache-2.5.4-linux-x86_64.AppImage` and `./ganache-2.5.4-linux-x86_64.AppImage`
- `truffle init`: Start a project.
- `truffle create <contract_name>`: Create a contract scaffold.
- `truffle compile`: Compile contract(s).
- To use Ganache update [truffle-config.js](truffle-config.js) with Ganache parameters.
```
    // Another network with more advanced options... *** GANACHE ***
    ganache: {
    port: 7545,             // Custom port
    network_id: 5777,       // Custom network
    gas: 6721975,           // Gas sent with each transaction (default: ~6700000)
    gasPrice: 20000000000,  // 20 gwei (in wei) (default: 100 gwei)
    from: 0xAa8A9823D2b9CFB3AD0E2209Ed5A02E0afFA4c54,        // Account to send txs from (default: accounts[0])
    websocket: true        // Enable EventEmitter interface for web3 (default: false)
    }
```
- Migrations: 
    - Blockchain is immutable, hence the code of the smart contracts. Every change has to be documented with migration scrips.
    - `1_blah`: The number followed by an underscore determines the order of the migrations. The rest is for humans.
    - Truffle init creates a Migration contract and an initial migration script.
    - For our contract(s), we need to create (a) migration script(s).
    - See [here](https://www.trufflesuite.com/docs/truffle/getting-started/running-migrations) for more on migration scripts.
- `truffle migrate <network_name>`: Migrate (deploy) our contract(s) to specified network. For our case, the network name is `ganache`.
- Confirm the transaction on the Blockchain via Ganache UI.

- Tests:
    - JS files goes into `test` folder.
    - Run tests with `truffle tests`




