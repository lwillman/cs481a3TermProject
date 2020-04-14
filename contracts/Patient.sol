pragma solidity >=0.5.0 <0.6.0;

import "./safemath.sol";

contract Patient {
    using SafeMath for uint256;
    using SafeMath for uint32;
    using SafeMath for uint16;

    event NewPatient(string virus, string longitude, string latitude, uint ageGroup, bool gender);

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
        string longitude;
        string latitude;
        uint ageGroup;
        bool gender;
    }

    Patient[] public patients;
    
    //mapping(address => uint) countryPatientCount;
    mapping(uint => string) public patientToVirus;
    mapping(string => uint) public virusPatientCount;

   function _createPatient(string memory _virus, string memory _longitude, string memory _latitude, uint _ageGroup, bool _gender) public {
        uint patientId = patients.push(Patient(_virus, _longitude, _latitude, _ageGroup, _gender));
        bytes32 virusID = keccak256(string_tobytes(_virus));
        patientToVirus[patientId - 1] = _virus;
        virusPatientCount[_virus] = virusPatientCount[_virus].add(1);
        emit NewPatient(_virus, _longitude, _latitude, _ageGroup, _gender);
   }

    function string_tobytes(string memory s) internal pure  returns (bytes memory){
        bytes memory b3 = bytes(s);
        return b3;
    }
}
