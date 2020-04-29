pragma solidity >=0.5.0 <0.6.0;
pragma experimental ABIEncoderV2;

import "./safemath.sol";

contract Storage {
    
    using SafeMath for uint256;
    using SafeMath for uint32;
    using SafeMath for uint16;
    
    /*
        AgeGroup { 1 = 0-10,
                   2 = 11-20,
                   3 = 21-30,
                   4 = 40-60,
                   5 = 60+
                   }
         gender true = male, false = female
    */
    
    struct Demographic {
        uint16 ageGroup;
        bool gender;
    }
    
    struct Record {
        string virus;
        string location;
        string latLon;
        uint count;
        // Demographic[] patients;
    }
    
    // These all need to be private before deployment, but leaving them public makes testing easier
    Record[] public records;
    mapping(string => uint) public recordByLatLon;          // "Lat/Lon" => THE index in records[]
    mapping(string => uint[]) public recordsByLocation;     // "region" => indices in records[]
    mapping(string => uint[]) public recordsByVirus;        // "virus" => indices in records[]
    
    address private authorizedInputContract;
    
    modifier isAuthorized(){
        // This code is misleading. Need to figure out how to separate calling contract from calling user address
        require(msg.sender == authorizedInputContract, "You must be authorized to add to this record set.");
        _;
    }
    
    // Necessary for 1 indexed records array in order to properly update infection counts at preexisting Lat/Lon records
    constructor () public {
        records.push(Record("none", "none", "none", 0));
    }
    
    // This needs to be onlyOwner but is not enforced in this version
    function changeInputContractAddress(address newInputContract) public {
        authorizedInputContract = newInputContract;
    }
    
    // This needs an authorization modifier
    function addRecord(string memory _virus, string memory _location, string memory _latlon) public returns (uint) {
        
        // Record exists for the given Lat/Lon
        if (recordByLatLon[_latlon] != 0){
            records[recordByLatLon[_latlon]].count = records[recordByLatLon[_latlon]].count.add(1); // Update patient count on preexisting record
            return recordByLatLon[_latlon];
        }
        
        // Create new record for given lat/lon
        uint newRecordIndex = records.push(Record(_virus, _location, _latlon, 1)) - 1;
        recordsByLocation[_location].push(newRecordIndex);
        recordsByVirus[_virus].push(newRecordIndex);
        recordByLatLon[_latlon] = newRecordIndex;
        
        return newRecordIndex;
        
    }
    
    // This needs an authorization modifier
    function addHistoricalRecord(string memory _virus, string memory _location, string memory _latlon, uint _recordCount) public returns (uint) {
        
        // Record exists for the given Lat/Lon
        if (recordByLatLon[_latlon] != 0){
            records[recordByLatLon[_latlon]].count = records[recordByLatLon[_latlon]].count.add(_recordCount);  // Update patient count on preexisting record
            return recordByLatLon[_latlon];
        }
        
        // Create new record for given lat/lon
        uint newRecordIndex = addRecord(_virus, _location, _latlon);
        records[newRecordIndex].count = _recordCount;
        return _recordCount;
        
    }
    
    // Returns the current case count for the given location (note: NOT for the given Lat/Lon)
    function totalPatientsPerLocation(string memory _location) public view returns (uint) {
        uint total = 0;
        
        for (uint i = 0; i < recordsByLocation[_location].length; i++){
            uint recordIndex = recordsByLocation[_location][i];
            total = total.add(records[recordIndex].count);
        }
        
        return total;
    }
    
    // Returns the current case count for the given virus
    function totalPatientsPerVirus(string memory _virus) public view returns (uint) {
        uint total = 0;
        
        for (uint i = 0; i < recordsByVirus[_virus].length; i++){
            uint recordIndex = recordsByVirus[_virus][i];
            total = total.add(records[recordIndex].count);
        }
        
        return total;
    }
    
    // Returns all records in the array (godspeed)
    function getRecords() public view returns (Record[] memory){
        return records;
    }
    
}
