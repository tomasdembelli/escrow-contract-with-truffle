Following it the actual response for the first migration.
```
➜  escrow-contract-with-truffle git:(main) ✗ truffle migrate --network ropsten_alchemy

Compiling your contracts...
===========================
> Everything is up to date, there is nothing to compile.



Migrations dry-run (simulation)
===============================
> Network name:    'ropsten_alchemy-fork'
> Network id:      3
> Block gas limit: 16100463 (0xf5ac6f)


1_initial_migration.js
======================

   Deploying 'Migrations'
   ----------------------
   > block number:        11028100
   > block timestamp:     1631482686
   > account:             0x2b8Bbad1879Ef83E65F3b1793F6B86ADAEF3482C
   > balance:             0.299646114
   > gas used:            176943 (0x2b32f)
   > gas price:           2 gwei
   > value sent:          0 ETH
   > total cost:          0.000353886 ETH

   -------------------------------------
   > Total cost:         0.000353886 ETH


2_approval_contract.js
======================

   Deploying 'ApprovalContract'
   ----------------------------
   > block number:        11028102
   > block timestamp:     1631482692
   > account:             0x2b8Bbad1879Ef83E65F3b1793F6B86ADAEF3482C
   > balance:             0.29899382
   > gas used:            298809 (0x48f39)
   > gas price:           2 gwei
   > value sent:          0 ETH
   > total cost:          0.000597618 ETH

   -------------------------------------
   > Total cost:         0.000597618 ETH


Summary
=======
> Total deployments:   2
> Final cost:          0.000951504 ETH





Starting migrations...
======================
> Network name:    'ropsten_alchemy'
> Network id:      3
> Block gas limit: 16084741 (0xf56f05)


1_initial_migration.js
======================

   Deploying 'Migrations'
   ----------------------
   > transaction hash:    0x008ad067c3bac600f6654bbf90e29b0dfe379391bab5f2ca3128224ba3117fa5
   > Blocks: 1            Seconds: 28
   > contract address:    0x4D7B56D6ed25dbAF5dE231D07a4bE742113B2506
   > block number:        11028100
   > block timestamp:     1631482693
   > account:             0x2b8Bbad1879Ef83E65F3b1793F6B86ADAEF3482C
   > balance:             0.29971013951172468
   > gas used:            193243 (0x2f2db)
   > gas price:           1.49997924 gwei
   > value sent:          0 ETH
   > total cost:          0.00028986048827532 ETH


   > Saving migration to chain.
   > Saving artifacts
   -------------------------------------
   > Total cost:     0.00028986048827532 ETH


2_approval_contract.js
======================

   Deploying 'ApprovalContract'
   ----------------------------
   > transaction hash:    0xa8e4abcd8ff406947e7e3700430ba22f881d3c6586e3fbc945cf6b48c4ee1c58
   > Blocks: 0            Seconds: 300
   > contract address:    0xe2065586Bc75B3b0bEfDD9149930Ee06c8e645cf
   > block number:        11023517
   > block timestamp:     1631410229
   > account:             0x2b8Bbad1879Ef83E65F3b1793F6B86ADAEF3482C
   > balance:             0.299641533461519988
   > gas used:            298809 (0x48f39)
   > gas price:           1.49997922 gwei
   > value sent:          0 ETH
   > total cost:          0.00044820729074898 ETH


   > Saving migration to chain.
   > Saving artifacts
   -------------------------------------
   > Total cost:     0.00044820729074898 ETH


Summary
=======
> Total deployments:   2
> Final cost:          0.0007380677790243 ETH
```