const Migrations = artifacts.require("Migrations");

// idk what this does, but everyone seems to use this

module.exports = function(deployer) {
  deployer.deploy(Migrations);
};
