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

contract entry8 {

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

        storageContract.addHistoricalRecord("COVID-19","Uganda","1,32",79);
        storageContract.addHistoricalRecord("COVID-19","Ukraine","48.3794,31.1656",8617);
        storageContract.addHistoricalRecord("COVID-19","United Arab Emirates","24,54",10349);
        storageContract.addHistoricalRecord("COVID-19","United Kingdom","32.3078,-64.7505",109);
        storageContract.addHistoricalRecord("COVID-19","United Kingdom","19.3133,-81.2546",70);
        storageContract.addHistoricalRecord("COVID-19","United Kingdom","49.3723,-2.3644",525);
        storageContract.addHistoricalRecord("COVID-19","United Kingdom","36.1408,-5.3536",141);
        storageContract.addHistoricalRecord("COVID-19","United Kingdom","54.2361,-4.5481",308);
        storageContract.addHistoricalRecord("COVID-19","United Kingdom","16.7425,-62.1874",11);
        storageContract.addHistoricalRecord("COVID-19","United Kingdom","55.3781,-3.436",152840);
        storageContract.addHistoricalRecord("COVID-19","Uruguay","-32.5228,-55.7658",606);
        storageContract.addHistoricalRecord("COVID-19","US","37.0902,-95.7129",965785);
        storageContract.addHistoricalRecord("COVID-19","Uzbekistan","41.3775,64.5853",1869);
        storageContract.addHistoricalRecord("COVID-19","Venezuela","6.4238,-66.5897",325);
        storageContract.addHistoricalRecord("COVID-19","Vietnam","16,108",270);
        storageContract.addHistoricalRecord("COVID-19","Zambia","-15.4167,28.2833",88);
        storageContract.addHistoricalRecord("COVID-19","Zimbabwe","-20,30",31);
        storageContract.addHistoricalRecord("COVID-19","Canada","0,0",0);
        storageContract.addHistoricalRecord("COVID-19","Dominica","15.415,-61.371",16);
        storageContract.addHistoricalRecord("COVID-19","Grenada","12.1165,-61.679",18);
        storageContract.addHistoricalRecord("COVID-19","Mozambique","-18.665695,35.529562",76);
        storageContract.addHistoricalRecord("COVID-19","Syria","34.802075,38.996815",43);
        storageContract.addHistoricalRecord("COVID-19","Timor-Leste","-8.874217,125.727539",24);
        storageContract.addHistoricalRecord("COVID-19","Belize","13.1939,-59.5432",18);
        storageContract.addHistoricalRecord("COVID-19","Canada","0,0",0);
        storageContract.addHistoricalRecord("COVID-19","Laos","19.85627,102.495496",19);
        storageContract.addHistoricalRecord("COVID-19","Libya","26.3351,17.228331",61);
        storageContract.addHistoricalRecord("COVID-19","West Bank and Gaza","31.9522,35.2332",342);
        storageContract.addHistoricalRecord("COVID-19","Guinea-Bissau","11.8037,-15.1804",53);
        storageContract.addHistoricalRecord("COVID-19","Mali","17.570692,-3.996166",389);
        storageContract.addHistoricalRecord("COVID-19","Saint Kitts and Nevis","17.357822,-62.782998",15);
    }
}