const Deposit = artifacts.require('Deposit');
const TestCoin = artifacts.require('TestCoin');

module.exports = (deployer) => {
  deployer.deploy(Deposit);
  deployer.deploy(TestCoin);
};
