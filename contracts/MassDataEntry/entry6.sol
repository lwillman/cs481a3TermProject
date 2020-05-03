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

contract entry6 {

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

        storageContract.addHistoricalRecord("COVID-19","Madagascar","-18.7669,46.8691",124);
        storageContract.addHistoricalRecord("COVID-19","Malaysia","2.5,112.5",5780);
        storageContract.addHistoricalRecord("COVID-19","Maldives","3.2028,73.2207",214);
        storageContract.addHistoricalRecord("COVID-19","Malta","35.9375,14.3754",448);
        storageContract.addHistoricalRecord("COVID-19","Mauritania","21.0079,10.9408",7);
        storageContract.addHistoricalRecord("COVID-19","Mauritius","-20.2,57.5",332);
        storageContract.addHistoricalRecord("COVID-19","Mexico","23.6345,-102.5528",14677);
        storageContract.addHistoricalRecord("COVID-19","Moldova","47.4116,28.3699",3408);
        storageContract.addHistoricalRecord("COVID-19","Monaco","43.7333,7.4167",94);
        storageContract.addHistoricalRecord("COVID-19","Mongolia","46.8625,103.8467",38);
        storageContract.addHistoricalRecord("COVID-19","Montenegro","42.5,19.3",321);
        storageContract.addHistoricalRecord("COVID-19","Morocco","31.7917,-7.0926",4065);
        storageContract.addHistoricalRecord("COVID-19","Namibia","-22.9576,18.4904",16);
        storageContract.addHistoricalRecord("COVID-19","Nepal","28.1667,84.25",52);
        storageContract.addHistoricalRecord("COVID-19","Netherlands","12.5186,-70.0358",100);
        storageContract.addHistoricalRecord("COVID-19","Netherlands","12.1696,-68.99",16);
        storageContract.addHistoricalRecord("COVID-19","Netherlands","18.0425,-63.0548",74);
        storageContract.addHistoricalRecord("COVID-19","Netherlands","52.1326,5.2913",37845);
        storageContract.addHistoricalRecord("COVID-19","New Zealand","-40.9006,174.886",1469);
        storageContract.addHistoricalRecord("COVID-19","Nicaragua","12.8654,-85.2072",13);
        storageContract.addHistoricalRecord("COVID-19","Niger","17.6078,8.0817",696);
        storageContract.addHistoricalRecord("COVID-19","Nigeria","9.082,8.6753",1273);
        storageContract.addHistoricalRecord("COVID-19","North Macedonia","41.6086,21.7453",1386);
        storageContract.addHistoricalRecord("COVID-19","Norway","60.472,8.4689",7527);
        storageContract.addHistoricalRecord("COVID-19","Oman","21,57",1998);
        storageContract.addHistoricalRecord("COVID-19","Pakistan","30.3753,69.3451",13328);
        storageContract.addHistoricalRecord("COVID-19","Panama","8.538,-80.7821",5779);
        storageContract.addHistoricalRecord("COVID-19","Papua New Guinea","-6.315,143.9555",8);
        storageContract.addHistoricalRecord("COVID-19","Paraguay","-23.4425,-58.4438",228);
        storageContract.addHistoricalRecord("COVID-19","Peru","-9.19,-75.0152",27517);
        storageContract.addHistoricalRecord("COVID-19","Philippines","13,122",7579);
    }
}