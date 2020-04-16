pragma solidity >=0.5.0 <0.6.0;

import "./safemath.sol";
import "./UserEntity.sol";

contract Patient {
    using SafeMath for uint256;
    using SafeMath for uint32;
    using SafeMath for uint16;

    event NewPatient(string virus, string location, string longitude, string latitude, uint ageGroup, bool gender);
    
   /* modifier canWrite() {
        require()
    }*/

    /*
        AgeGroup { 1 = 0-10,
                   2 = 11-20,
                   3 = 21-30,
                   4 = 40-60,
                   5 = 60+
                   }
         gender true = male, false = female
    */
    struct Patient {
        string virus;
        string location;
        string longitude;
        string latitude;
        uint ageGroup;
        bool gender;
    }

    Patient[] public patients;
    
    //mapping(address => uint) countryPatientCount;
    mapping(string => Patient[]) public patientsByLocation;
    mapping(string => Patient[]) public patientsByVirus;
    mapping(string => uint) public virusPatientCount;
    mapping(address => bool) public authorizedEntity;
    
    // Modifier for permissible reporting entities
    modifier isAuthorized(){
        require(authorizedEntity[msg.sender], "You do not have authorization to modify patient records.");
        _;
    }
    
    function _addUser() public {
        authorizedEntity[msg.sender] = true;
    }

   function _createPatient(string memory _virus, string memory _location, string memory _longitude, string memory _latitude, uint _ageGroup, bool _gender) public isAuthorized {
        uint patientId = patients.push(Patient(_virus, _location, _longitude, _latitude, _ageGroup, _gender));
        
        virusPatientCount[_virus] = virusPatientCount[_virus].add(1);
        patientsByLocation[_location].push(Patient(_virus, _location, _longitude, _latitude, _ageGroup, _gender));
        patientsByVirus[_virus].push(Patient(_virus, _location, _longitude, _latitude, _ageGroup, _gender));
        emit NewPatient(_virus, _location, _longitude, _latitude, _ageGroup, _gender);
   }

    function patientsPerLocation(string memory location) public view returns(uint) {
        return patientsByLocation[location].length;
    }
    
}
    
