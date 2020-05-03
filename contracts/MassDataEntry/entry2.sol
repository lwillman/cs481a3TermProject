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

contract entry2 {

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

        storageContract.addHistoricalRecord("COVID-19","Brazil","-14.235,-51.9253",63100);
        storageContract.addHistoricalRecord("COVID-19","Brunei","4.5353,114.7277",138);
        storageContract.addHistoricalRecord("COVID-19","Bulgaria","42.7339,25.4858",1300);
        storageContract.addHistoricalRecord("COVID-19","Burkina Faso","12.2383,-1.5616",632);
        storageContract.addHistoricalRecord("COVID-19","Cabo Verde","16.5388,-23.0418",106);
        storageContract.addHistoricalRecord("COVID-19","Cambodia","11.55,104.9167",122);
        storageContract.addHistoricalRecord("COVID-19","Cameroon","3.848,11.5021",1621);
        storageContract.addHistoricalRecord("COVID-19","Canada","53.9333,-116.5765",4480);
        storageContract.addHistoricalRecord("COVID-19","Canada","49.2827,-123.1207",1948);
        storageContract.addHistoricalRecord("COVID-19","Canada","37.6489,-122.6655",13);
        storageContract.addHistoricalRecord("COVID-19","Canada","53.7609,-98.8139",271);
        storageContract.addHistoricalRecord("COVID-19","Canada","46.5653,-66.4619",118);
        storageContract.addHistoricalRecord("COVID-19","Canada","53.1355,-57.6604",258);
        storageContract.addHistoricalRecord("COVID-19","Canada","44.682,-63.7443",873);
        storageContract.addHistoricalRecord("COVID-19","Canada","51.2538,-85.3232",15568);
        storageContract.addHistoricalRecord("COVID-19","Canada","46.5107,-63.4168",26);
        storageContract.addHistoricalRecord("COVID-19","Canada","52.9399,-73.5491",24109);
        storageContract.addHistoricalRecord("COVID-19","Canada","52.9399,-106.4509",353);
        storageContract.addHistoricalRecord("COVID-19","Central African Republic","6.6111,20.9394",19);
        storageContract.addHistoricalRecord("COVID-19","Chad","15.4542,18.7322",46);
        storageContract.addHistoricalRecord("COVID-19","Chile","-35.6751,-71.543",13331);
        storageContract.addHistoricalRecord("COVID-19","China","31.8257,117.2264",991);
        storageContract.addHistoricalRecord("COVID-19","China","40.1824,116.4142",593);
        storageContract.addHistoricalRecord("COVID-19","China","30.0572,107.874",579);
        storageContract.addHistoricalRecord("COVID-19","China","26.0789,117.9874",355);
        storageContract.addHistoricalRecord("COVID-19","China","37.8099,101.0583",139);
        storageContract.addHistoricalRecord("COVID-19","China","23.3417,113.4244",1587);
        storageContract.addHistoricalRecord("COVID-19","China","23.8298,108.7881",254);
        storageContract.addHistoricalRecord("COVID-19","China","26.8154,106.8748",147);
        storageContract.addHistoricalRecord("COVID-19","China","19.1959,109.7453",168);
        storageContract.addHistoricalRecord("COVID-19","China","39.549,116.1306",328);
    }
}