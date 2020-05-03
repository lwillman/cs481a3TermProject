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

contract entry7 {

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

        storageContract.addHistoricalRecord("COVID-19","Poland","51.9194,19.1451",11617);
        storageContract.addHistoricalRecord("COVID-19","Portugal","39.3999,-8.2245",23864);
        storageContract.addHistoricalRecord("COVID-19","Qatar","25.3548,51.1839",10287);
        storageContract.addHistoricalRecord("COVID-19","Romania","45.9432,24.9668",11036);
        storageContract.addHistoricalRecord("COVID-19","Russia","60,90",80949);
        storageContract.addHistoricalRecord("COVID-19","Rwanda","-1.9403,29.8739",191);
        storageContract.addHistoricalRecord("COVID-19","Saint Lucia","13.9094,-60.9789",15);
        storageContract.addHistoricalRecord("COVID-19","Saint Vincent and the Grenadines","12.9843,-61.2872",14);
        storageContract.addHistoricalRecord("COVID-19","San Marino","43.9424,12.4578",538);
        storageContract.addHistoricalRecord("COVID-19","Saudi Arabia","24,45",17522);
        storageContract.addHistoricalRecord("COVID-19","Senegal","14.4974,-14.4524",671);
        storageContract.addHistoricalRecord("COVID-19","Serbia","44.0165,21.0059",6630);
        storageContract.addHistoricalRecord("COVID-19","Seychelles","-4.6796,55.492",11);
        storageContract.addHistoricalRecord("COVID-19","Singapore","1.2833,103.8333",13624);
        storageContract.addHistoricalRecord("COVID-19","Slovakia","48.669,19.699",1379);
        storageContract.addHistoricalRecord("COVID-19","Slovenia","46.1512,14.9955",1396);
        storageContract.addHistoricalRecord("COVID-19","Somalia","5.1521,46.1996",436);
        storageContract.addHistoricalRecord("COVID-19","South Africa","-30.5595,22.9375",4546);
        storageContract.addHistoricalRecord("COVID-19","Spain","40,-4",226629);
        storageContract.addHistoricalRecord("COVID-19","Sri Lanka","7,81",523);
        storageContract.addHistoricalRecord("COVID-19","Sudan","12.8628,30.2176",237);
        storageContract.addHistoricalRecord("COVID-19","Suriname","3.9193,-56.0278",10);
        storageContract.addHistoricalRecord("COVID-19","Sweden","63,16",18640);
        storageContract.addHistoricalRecord("COVID-19","Switzerland","46.8182,8.2275",29061);
        storageContract.addHistoricalRecord("COVID-19","Taiwan*","23.7,121",429);
        storageContract.addHistoricalRecord("COVID-19","Tanzania","-6.369,34.8888",299);
        storageContract.addHistoricalRecord("COVID-19","Thailand","15,101",2922);
        storageContract.addHistoricalRecord("COVID-19","Togo","8.6195,0.8248",98);
        storageContract.addHistoricalRecord("COVID-19","Trinidad and Tobago","10.6918,-61.2225",115);
        storageContract.addHistoricalRecord("COVID-19","Tunisia","34,9",949);
        storageContract.addHistoricalRecord("COVID-19","Turkey","38.9637,35.2433",110130);
    }
}