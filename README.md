# Injective Token ERC-20 Contract
The Injective (INJ) ERC-20 token contract is created with the [OpenZeppelin Contracts Ethereum Package](https://github.com/OpenZeppelin/openzeppelin-contracts-ethereum-package). 

It is currently deployed on the Rinkeby Testnet at [`0xf1296687963C746D9A2311015A41C78F9BEfEE44`](https://rinkeby.etherscan.io/address/0xf1296687963C746D9A2311015A41C78F9BEfEE44). 


The token is an upgradable ERC20 token implementing the IERC20 interface.

## Installation

To begin with the project you need to install a usual NodeJS environment and yarn. You must also install the Open Zeppelin SDK CLI and the Ganache CLI:

```bash
$ npm install -g @openzeppelin/cli ganache-cli
```

After that, you can start fetching vendored dependencies:

```bash
$ npm install
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
? initialHolder (address): 0x5409ED021D9299bf6814279A6A1411A7e866A631
? minters (address[]):
? pausers (address[]):
✓ Instance created at 0x74341e87b1c4dB7D5ED95F92b37509F2525A7A90
0x74341e87b1c4dB7D5ED95F92b37509F2525A7A90
```

This creates an instance of the [`InjectiveToken`](https://github.com/InjectiveLabs/injective-token-contract/blob/master/contracts/InjectiveToken.sol) at `0x74341e87b1c4dB7D5ED95F92b37509F2525A7A90` (the deployed address will be different in each deployment). 
