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

let storageContractAddress = "0x3A4f9c081a386af6A5E4fd555c12dD0C8D5a7409";

module.exports = async function(deployer){
    // Uncomment this block to deploy and populate a new storage contract

    await deployer.deploy(Storage);
    let storageInstance = await Storage.deployed();
    storageContractAddress = storageInstance.address;
    console.log("Storage address: " + storageContractAddress);
    /*
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

    console.log("Deploy block cleared, now waiting for confirmation...");
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

    console.log("Deploy confirmation received.");
    for (var i = 0; i < dataSubset.length; i++){
        console.log("Submitting data subset " + i);
        await dataSubset[i].enter();
    }*/

    await deployer.deploy(Patient, storageContractAddress);
    await Patient.deployed();
}