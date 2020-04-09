pragma solidity ^0.5.16;
pragma experimental ABIEncoderV2;   // So that we can return patient structs in our view functions

import "./Ownable.sol";
import "./CountryCodes.sol";

/*
    Ideas for next steps (from Zoom call)
        Make a parent class for storing Viruses (see Virus struct below) and AuthorizedEntities data
        Move patient data mapping to Virus struct (organize patient datasets by virus)
        Make this class a patient record class
*/

contract RecordBase is Ownable {
    
    mapping(string => Patient) private patients;            // Maps identifier to patient. Identifier should have country code appended to avoid collisions
    mapping(string => string[]) private patientsByCountry;  // Maps country code to an array of patient identifiers for the given country (so we can loop over patients)
    mapping(address => bool) public authorizedEntity;       // Indicates whether an address is authorized to modify patient data
    mapping(address => string) public entityName;           // Maps authorized addresses to their institutional names
    
    // We want condition to be pigeon holed
    enum Condition { RECOVERED, DECEASED, REINFECTED }
    
    // Modifier for permissible reporting entities
    modifier isAuthorized(){
        require(authorizedEntity[msg.sender], "You do not have authorization to modify patient records.");
        _;
    }
    
    struct Location {
        string cityAndTerritory;
        string countryCode;
    }
    
    struct Patient {
        uint8 age;
        uint32 time;
        string name;        // Perhaps more appropriate for this to be a hash for patient privacy
        Location location;
        Condition condition;
        string reportingEntity;
    }
    
    struct Virus {
        string name;
        // Move patient data mapping here
    }
    
    
    // === MUTATOR FUNCTIONS ===
    // Add patient
    // Change patient condition
    // Add authorized entity (ownable)
    // Remove autorized entity (ownable)
    
    function addPatient(
        string calldata name, 
        string calldata identifier, 
        uint age, 
        Condition condition, 
        string calldata cityAndTerritory,
        string calldata countryCode
    ) external isAuthorized returns (bool){
        if (patients[identifier].time != 0) return false;   // Record exists
        Location memory patientLocation = Location(cityAndTerritory, countryCode);
        
        patients[identifier] = 
            Patient(
                age, now, name, patientLocation, condition, entityName[msg.sender]
            );
            
        patientsByCountry[countryCode].push(identifier);
    }
    
    function changePatientCondition(string calldata identifier, Condition condition) external isAuthorized returns (bool){
        Patient storage patientRec = patients[identifier];
        patientRec.condition = condition;
    }
    
    function addAuthorization(address entityAddress, string calldata nameOfEntity) external onlyOwner returns (bool){
        authorizedEntity[entityAddress] = true;
        entityName[entityAddress] = nameOfEntity;
    }
    
    function removeAuthorization(address entityAddress) external onlyOwner returns (bool){
        authorizedEntity[entityAddress] = false;
    }
    
    // === VIEW FUNCTIONS ===
    // Lookup patient by identifier
    // List all patients by country
    // Return all locations
    
    function getPatient(string calldata identifier) external view returns (Patient memory){
        return patients[identifier];
    }
    
    function getPatientsByCountry(string calldata countryCode) external view returns (Patient[] memory){
        string[] memory patientIdentifiers = patientsByCountry[countryCode];
        Patient[] memory countrySet = new Patient[](patientIdentifiers.length);
        
        for (uint i = 0; i < patientIdentifiers.length; i++){
            string memory identifier = patientIdentifiers[i];
            countrySet[i] = patients[identifier];
        }
        
        return countrySet;
    }
    
    
}
