require('dotenv').config();

const HDWalletProvider = require('@truffle/hdwallet-provider');
const infuraProjectId = process.env.INFURA_PROJECT_ID;
const infuraRopstenEndpoint = "https://ropsten.infura.io/v3/" + infuraProjectId;
const infuraRinkebyEndpoint = "https://rinkeby.infura.io/v3/" + infuraProjectId;
const alchemyRopstenEndpoint = process.env.ALCHEMY_ROPSTEN_ENDPOINT;
const alchemyRinkebyEndpoint = process.env.ALCHEMY_RINKEBY_ENDPOINT;
const alchemyKovanEndpoint = process.env.ALCHEMY_KOVAN_ENDPOINT;
const maticTestnetEndpoint = process.env.MATIC_TESTNET_ENDPOINT;

module.exports = {
  networks: {
    development: {
      protocol: 'http',
      host: 'localhost',
      port: 8545,
      gas: 5000000,
      gasPrice: 5e9,
      networkId: '*',
    },
    ropsten: {
      provider: () => new HDWalletProvider(process.env.DEV_MNEMONIC, alchemyRopstenEndpoint ? alchemyRopstenEndpoint : infuraRopstenEndpoint),
      networkId: 3,       // Ropsten's id
    },
    rinkeby: {
      provider: () => new HDWalletProvider(process.env.DEV_MNEMONIC, alchemyRinkebyEndpoint ? alchemyRinkebyEndpoint : infuraRinkebyEndpoint),
      networkId: 4,       // Rinkeby's id
    },
    kovan: {
      provider: () => new HDWalletProvider(process.env.DEV_MNEMONIC, alchemyKovanEndpoint),
      networkId: 42,       // Kovan's id
    },
    matic: {
      provider: () => new HDWalletProvider(process.env.DEV_MNEMONIC, maticTestnetEndpoint),
      networkId: 15001,    // Matic Tesnet id
    },
  },
};
