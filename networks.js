require('dotenv').config();

const HDWalletProvider = require('@truffle/hdwallet-provider');
const infuraProjectId = process.env.INFURA_PROJECT_ID;
const infuraRinkebyEndpoint = "https://rinkeby.infura.io/v3/" + infuraProjectId;
const alchemyRinkebyEndpoint = process.env.ALCHEMY_RINKEBY_ENDPOINT;
const alchemyKovanEndpoint = process.env.ALCHEMY_KOVAN_ENDPOINT;

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
    rinkeby: {
      provider: () => new HDWalletProvider(process.env.DEV_MNEMONIC, alchemyRinkebyEndpoint ? alchemyRinkebyEndpoint : infuraRinkebyEndpoint),
      networkId: 4,       // Rinkeby's id
    },
    kovan: {
      provider: () => new HDWalletProvider(process.env.DEV_MNEMONIC, alchemyKovanEndpoint),
      networkId: 42,       // Kovan's id
    },
  },
};
