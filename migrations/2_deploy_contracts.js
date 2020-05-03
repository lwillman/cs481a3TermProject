var Storage = artifacts.require("./Storage.sol");
var Patient = artifacts.require("./PatientData.sol");
var entries = [
    artifacts.require("./MassDataEntry/entry1.sol"),
    artifacts.require("./MassDataEntry/entry2.sol"),
    artifacts.require("./MassDataEntry/entry3.sol"),
    artifacts.require("./MassDataEntry/entry4.sol"),
    artifacts.require("./MassDataEntry/entry5.sol"),
    artifacts.require("./MassDataEntry/entry6.sol"),
    artifacts.require("./MassDataEntry/entry7.sol"),
    artifacts.require("./MassDataEntry/entry8.sol"),
    artifacts.require("./MassDataEntry/entry9.sol")
];

var deployAndPopulateNewStorageContract = true;

module.exports = async function(deployer){
    let storageContractAddress = "0x7AF30bdddBD23EFbe533d27e89c4b8c6eC5D149B";

    /*await deployer.deploy(Patient, storageContractAddress);
    await Patient.deployed();*/

    // New contract and populate from here on
    await deployer.deploy(Storage);
    let storageInstance = await Storage.deployed();
    storageContractAddress = storageInstance.address;
    console.log("STorage: " + storageContractAddress);

    await Promise.all([
        deployer.deploy(entries[0], storageContractAddress),
        deployer.deploy(entries[1], storageContractAddress),
        deployer.deploy(entries[2], storageContractAddress),
        deployer.deploy(entries[3], storageContractAddress),
        deployer.deploy(entries[4], storageContractAddress),
        deployer.deploy(entries[5], storageContractAddress),
        deployer.deploy(entries[6], storageContractAddress),
        deployer.deploy(entries[7], storageContractAddress),
        deployer.deploy(entries[8], storageContractAddress)
    ]);

    dataSubset = await Promise.all([
        entries[0].deployed(),
        entries[1].deployed(),
        entries[2].deployed(),
        entries[3].deployed(),
        entries[4].deployed(),
        entries[5].deployed(),
        entries[6].deployed(),
        entries[7].deployed(),
        entries[8].deployed()
    ]);
    
    for (var i = 0; i < dataSubset.length; i++){
        dataSubset[i].enter();
    }
}