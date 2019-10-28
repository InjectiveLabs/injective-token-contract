# Injective Token ERC-20 Contract
The Injective (INJ) ERC-20 token contract is created with the [OpenZeppelin Contracts Ethereum Package](https://github.com/OpenZeppelin/openzeppelin-contracts-ethereum-package). 

The token is an upgradable ERC20 token implementing the IERC20 interface.

## Installation

To begin with the project you need to install a usual NodeJS environment and yarn. You must also install the Open Zeppelin SDK CLI and the Ganache CLI:

```bash
$ yarn global add @openzeppelin/cli ganache-cli
```

After that, you can start fetching vendored dependencies:

```bash
$ yarn install
```

To deploy the Injective Token to your development network, initialize your local Ganache instance:

```bash
$ ganache-cli --deterministic
```

Then in a separate Terminal tab, initialize the Open Zeppelin SDK project:
```bash
$ oz init
? Welcome to the OpenZeppelin SDK! Choose a name for your project injective-token
? Initial project version 1.0.0
Project initialized. Write a new contract in the contracts folder and run 'openzeppelin create' to deploy it.
```


Then you can easily deploy the Injective Token Contract with the following steps:

```bash
$ oz create
? Pick a contract to instantiate InjectiveToken
? Pick a network development
All contracts are up to date
? Do you want to call a function on the instance after creating it? Yes
? Select which function * initialize(name: string, symbol: string, decimals: uint8, initialSupply: uint256, initialHolder: address, minters: address[],
pausers: address[])
? name (string): InjectiveToken
? symbol (string): INJ
? decimals (uint8): 18
? initialSupply (uint256): 100e18
? initialHolder (address): 0x90F8bf6A479f320ead074411a4B0e7944Ea8c9C1
? minters (address[]):
? pausers (address[]):
✓ Instance created at 0x22d5C8BdD4346b390014a07109a8F830094d4abf
0x22d5C8BdD4346b390014a07109a8F830094d4abf
```

This creates an instance of the [`InjectiveToken`](https://github.com/InjectiveLabs/injective-token-contract/blob/master/contracts/InjectiveToken.sol) at `0x22d5C8BdD4346b390014a07109a8F830094d4abf` (the deployed address will be different in each deployment). 

