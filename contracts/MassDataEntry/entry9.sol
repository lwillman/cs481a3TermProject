pragma solidity >=0.5.0 <0.6.0;

import "../Storage.sol";

/*
    Note: this entire contract is embarassing
    All of this nonsense is an attempt to get around the various limitations of the underlying technology.
    Contract length limitations, gas cost per transaction limitations

    IMPORTANT:
        1) You must update storageContractAddress by calling _setStorageContract if necessary
        2) You will need to copy/paste functions f1-f9 individually such that you are deploying only one of these functions at a time
        Otherwise you will exceed contract length and transaction limitations.
        3) The contract at 0x7AF30bdddBD23EFbe533d27e89c4b8c6eC5D149B has historical data through 4/28.
        PLEASE DO NOT ADD TO IT UNLESS ADDING NEW DAYS. Otherwise we will need to deploy 9 versions of this contract to rebuild the dataset on chain.

    Data Source: Johns Hopkins School of Public Health
    https://data.humdata.org/dataset/novel-coronavirus-2019-ncov-cases
*/

contract entry9 {

    Storage storageContract;
    address storageContractAddress; // You probably want to initialize this here rather than calling _setStorageContract for every deployment...

    /*constructor() public{
        storageContract = Storage(storageContractAddress);
    }*/

    constructor (address storageAddr) public {
        _setStorageContract(storageAddr);
    }

    function _setStorageContract(address _newStorageContractAddress) public {
        storageContractAddress = _newStorageContractAddress;
        storageContract = Storage(storageContractAddress);
    }

    function enter() public {
        require(storageContractAddress != address(0), "You have to set the storage contract address first.");

        storageContract.addHistoricalRecord("COVID-19","Canada","64.8255,-124.8457",5);
        storageContract.addHistoricalRecord("COVID-19","Canada","64.2823,-135",11);
        storageContract.addHistoricalRecord("COVID-19","Kosovo","42.602636,20.902977",510);
        storageContract.addHistoricalRecord("COVID-19","Burma","21.9162,95.956",146);
        storageContract.addHistoricalRecord("COVID-19","United Kingdom","18.2206,-63.0686",3);
        storageContract.addHistoricalRecord("COVID-19","United Kingdom","18.4207,-64.64",6);
        storageContract.addHistoricalRecord("COVID-19","United Kingdom","21.694,-71.7979",11);
        storageContract.addHistoricalRecord("COVID-19","MS Zaandam","0,0",9);
        storageContract.addHistoricalRecord("COVID-19","Botswana","-22.3285,24.6849",22);
        storageContract.addHistoricalRecord("COVID-19","Burundi","-3.3731,29.9189",11);
        storageContract.addHistoricalRecord("COVID-19","Sierra Leone","8.460555,-11.779889",93);
        storageContract.addHistoricalRecord("COVID-19","Netherlands","12.1784,-68.2385",5);
        storageContract.addHistoricalRecord("COVID-19","Malawi","-13.254308,34.301525",34);
        storageContract.addHistoricalRecord("COVID-19","United Kingdom","-51.7963,-59.5236",13);
        storageContract.addHistoricalRecord("COVID-19","France","46.8852,-56.3159",1);
        storageContract.addHistoricalRecord("COVID-19","South Sudan","6.877,31.307",6);
        storageContract.addHistoricalRecord("COVID-19","Western Sahara","24.2155,-12.8858",6);
        storageContract.addHistoricalRecord("COVID-19","Sao Tome and Principe","0.18636,6.613081",4);
        storageContract.addHistoricalRecord("COVID-19","Yemen","15.552727,48.516388",1);
    }
}
