# escrow-contract-with-truffle
Ethereum smart contract with truffle/solidity.

Based on [Ethereum: Building Blockchain Decentralized Apps](https://www.linkedin.com/learning/ethereum-building-blockchain-decentralized-apps-dapps) Linkedn learning course.

## Ethereum/Solidity
- Pure functions: They don't (should not) read or modify the state. See this [example](https://www.tutorialspoint.com/solidity/solidity_pure_functions.htm). They don't cost gas, there is a [caveat](https://ethereum.stackexchange.com/questions/52885/view-pure-gas-usage-cost-gas-if-called-internally-by-another-function).

- Ethereum Virtual Machine (EVM) does not compile source code. It only parses byte code. So, compile your contract before deploying it.

- Solidity [cheat-sheet](https://docs.soliditylang.org/en/v0.8.7/cheatsheet.html).

## Development Set-up
- [Truffle](https://www.trufflesuite.com/docs/truffle/overview): Development environment for EVM.
- [Ganache](https://www.trufflesuite.com/ganache): Blockchain for Ethereum.
- Run Ganache: `chmod a+x ganache-2.5.4-linux-x86_64.AppImage` and `./ganache-2.5.4-linux-x86_64.AppImage`
- `truffle init`: Start a project.
- `truffle create <contract_name>`: Create a contract scaffold.
- `truffle compile`: Compile contract(s).
- To use Ganache update [truffle-config.js](truffle-config.js) with Ganache parameters. See [here](https://www.trufflesuite.com/docs/truffle/quickstart#alternative-migrating-with-ganache) for more.
```
    development: {
     host: "127.0.0.1",     // Localhost (default: none)
     port: 8545,            // Standard Ethereum port (default: none)
     network_id: "*",       // Any network (default: none)
    },
```

- Migrations: 
    - Migration can be thought like deploying a server side code/application to a web server.
    - Truffle provides tools to migrate (deploy) our code to ethereum blockchain.
    - `1_blah`: The number followed by an underscore determines the order of the migrations. The rest is for humans.
    - Truffle init creates a Migration contract and an initial migration script.
    - For our contract(s), we need to create (a) migration script(s).
    - See [here](https://www.trufflesuite.com/docs/truffle/getting-started/running-migrations) for more on migration scripts.
- `truffle migrate --network <network_name>`: Migrate (deploy) our contract(s) to specified network. For our case, the network name is `ganache`.
- Confirm the transaction on the Blockchain via Ganache UI.
- Gotcha: `"Migrations" -- Returned error: sender account not recognized.` => Remove/comment out the `from` attribute of network definition.

- Tests:
    - JS files goes into `test` folder.
    - Run tests with `truffle tests`
- Web UI: 
    - `web3`: [web3.js](https://web3js.readthedocs.io/en/v1.4.0/getting-started.html) library is a collection of modules that contain functionality for th ethereum ecosystem.
    - EIP-1193: [Ethereum Provider JavaScript API definitions](https://eips.ethereum.org/EIPS/eip-1193#definitions) should be read for `provider`, `client`, `RPC`, `wallet`.
    - An individual web3 provider ensures connection to a local/remote node (chain/server).
    - ABI - Application Binary Interface: JSON encoding of a smart contract, find it in `build/contracts/<myContract>/['abi']`. 
    - Make ABI available in UI docs in a JS file.
    - Gotcha: `[call](https://web3js.readthedocs.io/en/v1.2.11/web3-eth-contract.html#methods-mymethod-call)` method on contracts does not alter state of the smart contract. If a method is trying to change state, it is silently ignored. Use `[send](https://web3js.readthedocs.io/en/v1.2.11/web3-eth-contract.html#methods-mymethod-send)` if there is a state change, e.g. updating balance. 

- Ganache:
    - Restart Ganache after a configuration change.
    - Use Ganache/Contracts to see the smart contracts in the EVM.
