var BrokerContract = artifacts.require("BrokerContract.sol");

module.exports = function(deployer) {
  deployer.deploy(BrokerContract);
};
