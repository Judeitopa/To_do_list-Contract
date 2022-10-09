const HDWalletProvider = require('@truffle/hdwallet-provider');
const PROJECT_ID = "d475a4008f384e0b9158063675220d28";
const fs = require('fs');
const MNEMONIC = fs.readFileSync(".secret").toString().trim();
module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 9545,
      network_id: "*"
    },
    
    goerli: {
      provider: () => new HDWalletProvider(MNEMONIC, `https://goerli.infura.io/v3/${PROJECT_ID}`),
      network_id: 5,
      networkCheckTimeout: 10000,
      gas: 6000000,
      confirmations: 2,
      timeoutBlocks: 200,
      skipDryRun: true
    },
    ganache: {
      host: "127.0.0.1",
      port: 9545,
      network_id: "*"
    },
    
  },
  mocha: {},
  compilers: {
    solc: {
      version: "0.8.17"
    }
  }
};
