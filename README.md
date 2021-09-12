# escrow-contract-with-truffle
Ethereum smart contract with truffle/solidity.

Based on [Ethereum: Building Blockchain Decentralized Apps](https://www.linkedin.com/learning/ethereum-building-blockchain-decentralized-apps-dapps) Linkedn learning course.

ABI: Application Binary Interface. A JSON abstraction of our smart contract.

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

## Smart Contract Deployment to live networks (Backend):
    - Requires interaction with an [Ethereum node](https://ethereum.org/en/developers/docs/nodes-and-clients/). 
    - Go Ethereum (geth) is the most common one if we want to run a node locally.
    - Other alternatives would be connecting a public node or using a service like [Infura](https://infura.io/) or [Alchemy](https://www.alchemy.com/).

### From a local node with Go Ethereum (geth)
- Install geth as described in [official Ethereum documents](https://geth.ethereum.org/docs/install-and-build/installing-geth).
- Create a new account for mainnet: `geth account new`
- Start geth and sync-up with the main network: `geth`
- Create a new account for `ropsten` proof-of-work test network: `geth --ropsten account new`
- Start/sync with to `ropsten` network: `geth --ropsten`. [For other supported networks see here](https://geth.ethereum.org/docs/interface/peer-to-peer).
- Providing some additional options: `geth --ropsten --syncmode fast --cache 1024 --http --http.api eth,net,web3,personal --allow-insecure-unlock`
    - `http`: Enable the HTTP-RPC server. Allows logging-in and use cli.
    - `http.api`: Select exposed APIs over the HTTP-RPC interface.
    - `allow-insecure-unlock`: Required for unlocking account through http server.
- Get some test ETHs from a faucet:
    - List the accounts for ropsten `geth --ropsten account list` and get the address.
    - Request ETH from [ropsten faucet](https://faucet.ropsten.be/). Address must start with `0x`.
    - Check the status of the transaction from: `https://ropsten.etherscan.io/tx/..` <= keep an eye on your address 
    - Attach to local geth server `geth attach http://127.0.0.1:8545` to start a [JavaScript Console](https://geth.ethereum.org/docs/interface/javascript-console).
        - Check if it is still syncing: `eth.syncing`. Expect `false`.
        - Unlock the first account: `personal.unlockAccount(eth.accounts[0])`
        - Check the balance: `web3.eth.getBalance(eth.accounts[0])` => if still syncing, this will show 0.
        - Before moving on to deployment, make sure to see enough ETH in this account. This is necessary for deployment transaction.
- Deploy to ropsten testnet:
    - Update `truffle.js` by adding a new network for ropsten:
    ```
    ropsten: {
      host: "127.0.0.1",     
      port: 8545,            
      network_id: 3, 
      gas: 2900000,      
    },
    ```
    - Run `truffle migrate --network ropsten`
    - Get the `ApprovalContract` address and use it in the UI.
- Remove chain data: `geth --ropsten removedb` or `geth removedb` for mainnet.

### From a remote node (Alchemy)
- [Deploying smart contract with Alchemy](https://docs.alchemy.com/alchemy/tutorials/hello-world-smart-contract)
- Create a wallet and account on Ropsten with [Metamask](https://metamask.zendesk.com/hc/en-us/articles/360015489531-Getting-started-with-MetaMask)
- Add ETH to your account from [ropsten faucet](https://faucet.ropsten.be/).
- Confirm that your account has ETH on [Etherscan](https://ropsten.etherscan.io/address/0x2b8bbad1879ef83e65f3b1793f6b86adaef3482c).
- Install HDWalletProvider `npm install @truffle/hdwallet-provider`. This will enable connecting to Ethereum network through a provider like Alchemy.
- Install dotenv for using environment variable file: `npm install dotenv --save`.
- Create an `.env` file and fill it as:
```
API_URL = "https://eth-ropsten.alchemyapi.io/v2/your-api-key"
MNEMONIC = "your-metamask-seed-phrase"
```
- Configure `truffle-config.js`
```
require('dotenv').config();
const HDWalletProvider = require("@truffle/hdwallet-provider");
const { API_URL, MNEMONIC } = process.env;

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*"
    },
    ropsten: {
      provider: function() {
        return new HDWalletProvider(MNEMONIC, API_URL)
      },
      network_id: 3,
      gas: 4000000 //4M is the max
    }
  }
};
```
- Run `truffle migrate --network ropsten`
- Tip1: HDWalletProvider will use the first account in your wallet. If you want to select a specific account you need to pass the zero-based index of it as:
```
  provider: function() {
    return new HDWalletProvider(MNEMONIC, API_URL, 1)
  },
```
- Tip2: If the migration is failing because of insufficient fund, and you don't recognize the account IDs, then double check the MNEMONIC used in the `.env` file. 
- After successful migration, keep the contract address and check the status of it on etherscan: https://ropsten.etherscan.io/address/0xe..
- Tip3: Updating a contract code means creating a new contract on a new address. Therefore to be able to deploy the new contract (even though it is just a code update on your local machine), you should add a new migration script by incrementing the last script number.




## UI Files Deployment to Swarm (Frontend): 

- Deploy web files on testnet via swarm
    - 






