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

contract entry3 {

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

        storageContract.addHistoricalRecord("COVID-19","China","47.862,127.7615",936);
        storageContract.addHistoricalRecord("COVID-19","China","33.882,113.614",1276);
        storageContract.addHistoricalRecord("COVID-19","China","22.3,114.2",1037);
        storageContract.addHistoricalRecord("COVID-19","China","30.9756,112.2707",68128);
        storageContract.addHistoricalRecord("COVID-19","China","27.6104,111.7088",1019);
        storageContract.addHistoricalRecord("COVID-19","China","44.0935,113.9448",198);
        storageContract.addHistoricalRecord("COVID-19","China","32.9711,119.455",653);
        storageContract.addHistoricalRecord("COVID-19","China","27.614,115.7221",937);
        storageContract.addHistoricalRecord("COVID-19","China","43.6661,126.1923",110);
        storageContract.addHistoricalRecord("COVID-19","China","41.2956,122.6085",146);
        storageContract.addHistoricalRecord("COVID-19","China","22.1667,113.55",45);
        storageContract.addHistoricalRecord("COVID-19","China","37.2692,106.1655",75);
        storageContract.addHistoricalRecord("COVID-19","China","35.7452,95.9956",18);
        storageContract.addHistoricalRecord("COVID-19","China","35.1917,108.8701",286);
        storageContract.addHistoricalRecord("COVID-19","China","36.3427,118.1498",787);
        storageContract.addHistoricalRecord("COVID-19","China","31.202,121.4491",642);
        storageContract.addHistoricalRecord("COVID-19","China","37.5777,112.2922",197);
        storageContract.addHistoricalRecord("COVID-19","China","30.6171,102.7103",561);
        storageContract.addHistoricalRecord("COVID-19","China","39.3054,117.323",190);
        storageContract.addHistoricalRecord("COVID-19","China","31.6927,88.0924",1);
        storageContract.addHistoricalRecord("COVID-19","China","41.1129,85.2401",76);
        storageContract.addHistoricalRecord("COVID-19","China","24.974,101.487",185);
        storageContract.addHistoricalRecord("COVID-19","China","29.1832,120.0934",1268);
        storageContract.addHistoricalRecord("COVID-19","Colombia","4.5709,-74.2973",5379);
        storageContract.addHistoricalRecord("COVID-19","Congo (Brazzaville)","-4.0383,21.7587",200);
        storageContract.addHistoricalRecord("COVID-19","Congo (Kinshasa)","-4.0383,21.7587",442);
        storageContract.addHistoricalRecord("COVID-19","Costa Rica","9.7489,-83.7534",695);
        storageContract.addHistoricalRecord("COVID-19","Cote d'Ivoire","7.54,-5.5471",1150);
        storageContract.addHistoricalRecord("COVID-19","Croatia","45.1,15.2",2030);
        storageContract.addHistoricalRecord("COVID-19","Diamond Princess","0,0",712);
        storageContract.addHistoricalRecord("COVID-19","Cuba","22,-80",1369);
    }
}