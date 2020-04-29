pragma solidity >=0.5.0 <0.6.0;

import "./Storage.sol";

contract PatientData {
    using SafeMath for uint256;
    using SafeMath for uint32;
    using SafeMath for uint16;

    event NewPatient(string virus, string location, string latLon);

    mapping(address => bool) public authorizedEntity;
    address storageAddress;
    Storage storageContract;

    // Modifier for permissible reporting entities
    modifier isAuthorized(){
        require(authorizedEntity[msg.sender], "You do not have authorization to modify patient records.");
        _;
    }
    
    // This needs to be onlyOwner
    function _addUser() public {
        authorizedEntity[msg.sender] = true;
    }
    
    // This needs to be onlyOwner
    function _setStorageContract(address _newStorageContractAddress) public {
        storageAddress = _newStorageContractAddress;
        storageContract = Storage(storageAddress);
    }
    
    // This is now merely a proxy function to the storage
    // This needs to have an authorization modifier, or let Storage.sol take care of this too
    function _createPatient(string memory _virus, string memory _location, string memory _latLon) public {
        storageContract.addRecord(_virus, _location, _latLon);
        emit NewPatient(_virus, _location, _latLon);
    }

    function patientsPerLocation(string memory location) public view returns(uint) {
        return storageContract.totalPatientsPerLocation(location);
    }

    function totalPatientsPerVirus(string memory virus) public view returns(uint) {
        return storageContract.totalPatientsPerVirus(virus);
    }

}
