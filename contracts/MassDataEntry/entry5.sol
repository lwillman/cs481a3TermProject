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

contract entry5 {

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

        storageContract.addHistoricalRecord("COVID-19","Ghana","7.9465,-1.0232",1550);
        storageContract.addHistoricalRecord("COVID-19","Greece","39.0742,21.8243",2517);
        storageContract.addHistoricalRecord("COVID-19","Guatemala","15.7835,-90.2308",500);
        storageContract.addHistoricalRecord("COVID-19","Guinea","9.9456,-9.6966",996);
        storageContract.addHistoricalRecord("COVID-19","Guyana","5,-58.75",74);
        storageContract.addHistoricalRecord("COVID-19","Haiti","18.9712,-72.2852",74);
        storageContract.addHistoricalRecord("COVID-19","Holy See","41.9029,12.4534",9);
        storageContract.addHistoricalRecord("COVID-19","Honduras","15.2,-86.2419",627);
        storageContract.addHistoricalRecord("COVID-19","Hungary","47.1625,19.5033",2500);
        storageContract.addHistoricalRecord("COVID-19","Iceland","64.9631,-19.0208",1792);
        storageContract.addHistoricalRecord("COVID-19","India","21,78",27890);
        storageContract.addHistoricalRecord("COVID-19","Indonesia","-0.7893,113.9213",8882);
        storageContract.addHistoricalRecord("COVID-19","Iran","32,53",90481);
        storageContract.addHistoricalRecord("COVID-19","Iraq","33,44",1820);
        storageContract.addHistoricalRecord("COVID-19","Ireland","53.1424,-7.6921",19262);
        storageContract.addHistoricalRecord("COVID-19","Israel","31,35",15443);
        storageContract.addHistoricalRecord("COVID-19","Italy","43,12",197675);
        storageContract.addHistoricalRecord("COVID-19","Jamaica","18.1096,-77.2975",350);
        storageContract.addHistoricalRecord("COVID-19","Japan","36,138",13441);
        storageContract.addHistoricalRecord("COVID-19","Jordan","31.24,36.51",447);
        storageContract.addHistoricalRecord("COVID-19","Kazakhstan","48.0196,66.9237",2717);
        storageContract.addHistoricalRecord("COVID-19","Kenya","-0.0236,37.9062",355);
        storageContract.addHistoricalRecord("COVID-19","Korea, South","36,128",10738);
        storageContract.addHistoricalRecord("COVID-19","Kuwait","29.5,47.75",3075);
        storageContract.addHistoricalRecord("COVID-19","Kyrgyzstan","41.2044,74.7661",682);
        storageContract.addHistoricalRecord("COVID-19","Latvia","56.8796,24.6032",812);
        storageContract.addHistoricalRecord("COVID-19","Lebanon","33.8547,35.8623",707);
        storageContract.addHistoricalRecord("COVID-19","Liberia","6.4281,-9.4295",124);
        storageContract.addHistoricalRecord("COVID-19","Liechtenstein","47.14,9.55",82);
        storageContract.addHistoricalRecord("COVID-19","Lithuania","55.1694,23.8813",1438);
        storageContract.addHistoricalRecord("COVID-19","Luxembourg","49.8153,6.1296",3723);
    }
}