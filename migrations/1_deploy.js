const Deposit = artifacts.require('Deposit');

module.exports = (deployer) => {
  deployer.deploy(Deposit);
};
