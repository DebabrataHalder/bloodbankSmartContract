// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract BloodBank{

    address owner;

    constructor(){
        owner=msg.sender;
    }


    enum PatientType{
        Doner,Recipient
    }

    struct BloodTransaction{
        PatientType patientType;
        uint256 time;
        address from;
        address to;
    }

    struct Patient{
        uint256 gov_UID;
        string name;
        uint256 age;
        string bloodGroup;
        uint256 contact;
        string homeAddress;
        BloodTransaction[] bT;
    }

    Patient[] PatientRecord;
    

    mapping(uint256=>uint256)PatientRecordIndex;

    event Successfull(string message);
    
    function newPatient(
        uint256 _gov_UID,
        string memory _name,
        uint256 _age,
        string memory _bloodGroup,
        uint256 _contact,
        string memory _homeAddress   
    )external{
        require(msg.sender==owner,"only admin can register new patient");
        uint index=PatientRecord.length;
        PatientRecord.push();
        PatientRecord[index].name=_name;
        PatientRecord[index].bloodGroup=_bloodGroup;
        PatientRecord[index].contact=_contact;
        PatientRecord[index].homeAddress=_homeAddress;
        PatientRecord[index].age=_age;
        PatientRecord[index].gov_UID=_gov_UID;
        PatientRecordIndex[_gov_UID]=index;

        emit Successfull("Patient added successfully");
    }
    
    function getPatientRecord(uint _gov_UID)
     public view 
     returns ( Patient memory)
     {
        uint index= PatientRecordIndex[_gov_UID];
        return PatientRecord[index];
     }

     function getAllRecords() public view returns(Patient[] memory ){

    return PatientRecord;
    }

    function bloodTransaction(
        uint256 _gov_UID,
        PatientType _type,
        address _from,
        address _to
    ) external {
        require(msg.sender==owner,
        "only hospital can update the patient's blood transaction data"
        );

        uint256 index=PatientRecordIndex[_gov_UID];

        BloodTransaction memory txObj=BloodTransaction( _type,_gov_UID, _from, _to );
        
        PatientRecord[index].bT.push(txObj);
        emit Successfull(
            "Patient blood transaction data is updated successfully");
        
    }



}

