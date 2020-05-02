var Storage = artifacts.require("./Storage.sol");
var Patient = artifacts.require("./PatientData.sol");

module.exports = function(deployer){
    // deployer.deploy(Storage);
    let storageContractAddress = "0x7AF30bdddBD23EFbe533d27e89c4b8c6eC5D149B";
    deployer.deploy(Patient, storageContractAddress);
}