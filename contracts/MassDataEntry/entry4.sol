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

contract entry4 {

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

        storageContract.addHistoricalRecord("COVID-19","Cyprus","35.1264,33.4299",817);
        storageContract.addHistoricalRecord("COVID-19","Czechia","49.8175,15.473",7404);
        storageContract.addHistoricalRecord("COVID-19","Denmark","61.8926,-6.9118",187);
        storageContract.addHistoricalRecord("COVID-19","Denmark","71.7069,-42.6043",11);
        storageContract.addHistoricalRecord("COVID-19","Denmark","56.2639,9.5018",8575);
        storageContract.addHistoricalRecord("COVID-19","Djibouti","11.8251,42.5903",1023);
        storageContract.addHistoricalRecord("COVID-19","Dominican Republic","18.7357,-70.1627",6135);
        storageContract.addHistoricalRecord("COVID-19","Ecuador","-1.8312,-78.1834",22719);
        storageContract.addHistoricalRecord("COVID-19","Egypt","26,30",4534);
        storageContract.addHistoricalRecord("COVID-19","El Salvador","13.7942,-88.8965",298);
        storageContract.addHistoricalRecord("COVID-19","Equatorial Guinea","1.5,10",258);
        storageContract.addHistoricalRecord("COVID-19","Eritrea","15.1794,39.7823",39);
        storageContract.addHistoricalRecord("COVID-19","Estonia","58.5953,25.0136",1643);
        storageContract.addHistoricalRecord("COVID-19","Eswatini","-26.5225,31.4659",59);
        storageContract.addHistoricalRecord("COVID-19","Ethiopia","9.145,40.4897",123);
        storageContract.addHistoricalRecord("COVID-19","Fiji","-17.7134,178.065",18);
        storageContract.addHistoricalRecord("COVID-19","Finland","64,26",4576);
        storageContract.addHistoricalRecord("COVID-19","France","3.9339,-53.1258",111);
        storageContract.addHistoricalRecord("COVID-19","France","-17.6797,149.4068",57);
        storageContract.addHistoricalRecord("COVID-19","France","16.25,-61.5833",149);
        storageContract.addHistoricalRecord("COVID-19","France","-12.8275,45.1662",401);
        storageContract.addHistoricalRecord("COVID-19","France","-20.9043,165.618",18);
        storageContract.addHistoricalRecord("COVID-19","France","-21.1351,55.2471",417);
        storageContract.addHistoricalRecord("COVID-19","France","17.9,-62.8333",6);
        storageContract.addHistoricalRecord("COVID-19","France","18.0708,-63.0501",38);
        storageContract.addHistoricalRecord("COVID-19","France","14.6415,-61.0242",175);
        storageContract.addHistoricalRecord("COVID-19","France","46.2276,2.2137",160847);
        storageContract.addHistoricalRecord("COVID-19","Gabon","-0.8037,11.6094",176);
        storageContract.addHistoricalRecord("COVID-19","Gambia","13.4432,-15.3101",10);
        storageContract.addHistoricalRecord("COVID-19","Georgia","42.3154,43.3569",486);
        storageContract.addHistoricalRecord("COVID-19","Germany","51,9",157770);
    }
}