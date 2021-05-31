const Deposit = artifacts.require('Deposit');
const TestCoin = artifacts.require('TestCoin');
const Test = artifacts.require('Test');

module.exports = (deployer) => {
  deployer.deploy(Deposit);
  deployer.deploy(TestCoin);
  // deployer.deploy(Test);
};
