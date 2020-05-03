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

contract entry1 {
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

        storageContract.addHistoricalRecord("COVID-19","Afghanistan","33,65",1531);
        storageContract.addHistoricalRecord("COVID-19","Albania","41.1533,20.1683",726);
        storageContract.addHistoricalRecord("COVID-19","Algeria","28.0339,1.6596",3382);
        storageContract.addHistoricalRecord("COVID-19","Andorra","42.5063,1.5218",738);
        storageContract.addHistoricalRecord("COVID-19","Angola","-11.2027,17.8739",26);
        storageContract.addHistoricalRecord("COVID-19","Antigua and Barbuda","17.0608,-61.7964",24);
        storageContract.addHistoricalRecord("COVID-19","Argentina","-38.4161,-63.6167",3892);
        storageContract.addHistoricalRecord("COVID-19","Armenia","40.0691,45.0382",1746);
        storageContract.addHistoricalRecord("COVID-19","Australia","-35.4735,149.0124",106);
        storageContract.addHistoricalRecord("COVID-19","Australia","-33.8688,151.2093",3002);
        storageContract.addHistoricalRecord("COVID-19","Australia","-12.4634,130.8456",28);
        storageContract.addHistoricalRecord("COVID-19","Australia","-28.0167,153.4",1030);
        storageContract.addHistoricalRecord("COVID-19","Australia","-34.9285,138.6007",438);
        storageContract.addHistoricalRecord("COVID-19","Australia","-41.4545,145.9707",212);
        storageContract.addHistoricalRecord("COVID-19","Australia","-37.8136,144.9631",1349);
        storageContract.addHistoricalRecord("COVID-19","Australia","-31.9505,115.8605",549);
        storageContract.addHistoricalRecord("COVID-19","Austria","47.5162,14.5501",15225);
        storageContract.addHistoricalRecord("COVID-19","Azerbaijan","40.1431,47.5769",1645);
        storageContract.addHistoricalRecord("COVID-19","Bahamas","25.0343,-77.3963",80);
        storageContract.addHistoricalRecord("COVID-19","Bahrain","26.0275,50.55",2647);
        storageContract.addHistoricalRecord("COVID-19","Bangladesh","23.685,90.3563",5416);
        storageContract.addHistoricalRecord("COVID-19","Barbados","13.1939,-59.5432",79);
        storageContract.addHistoricalRecord("COVID-19","Belarus","53.7098,27.9534",10463);
        storageContract.addHistoricalRecord("COVID-19","Belgium","50.8333,4",46134);
        storageContract.addHistoricalRecord("COVID-19","Benin","9.3077,2.3158",64);
        storageContract.addHistoricalRecord("COVID-19","Bhutan","27.5142,90.4336",7);
        storageContract.addHistoricalRecord("COVID-19","Bolivia","-16.2902,-63.5887",950);
        storageContract.addHistoricalRecord("COVID-19","Bosnia and Herzegovina","43.9159,17.6791",1516);
    }
}