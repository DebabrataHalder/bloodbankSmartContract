# BloodBank Smart Contract

The `BloodBank` smart contract is designed to manage and record the details of blood donors and recipients, including their personal information and blood transactions. This contract is built on the Ethereum blockchain using Solidity.

---

## Features

1. **Owner-Only Access**: 
   - Only the contract owner (typically the hospital or blood bank admin) can register new patients and update blood transaction data.

2. **Patient Management**:
   - The contract stores essential information about patients, such as government ID, name, age, blood group, contact number, and home address.
   - Patient data is recorded and managed securely on the blockchain.

3. **Blood Transaction Recording**:
   - The contract allows the owner to record blood transactions between donors and recipients, tracking the transaction time and involved parties.

4. **Patient Data Retrieval**:
   - Anyone can view the details of a patient by providing their unique government ID.
   - The contract also allows the retrieval of all patient records.

5. **Event Emission**:
   - The contract emits events upon successful operations, such as patient registration and transaction updates, providing a transparent and traceable log of activities.

---

## Functions

- **`constructor()`**: 
  Initializes the contract and sets the contract deployer as the owner.

- **`newPatient()`**: 
  Registers a new patient in the system. This function can only be called by the owner.

- **`getPatientRecord()`**: 
  Retrieves the details of a patient by their government-issued ID.

- **`getAllRecords()`**: 
  Retrieves the entire list of patients stored in the contract.

- **`bloodTransaction()`**: 
  Records a blood transaction between a donor and a recipient. This function can only be called by the owner.

---

## Data Structures

- **`enum PatientType`**: 
  Represents the type of patient, either `Donor` or `Recipient`.

- **`struct BloodTransaction`**: 
  Records the details of a blood transaction, including the patient type, transaction time, and involved parties.

- **`struct Patient`**: 
  Stores patient information such as government ID, name, age, blood group, contact, address, and blood transactions.

---

## Events

- **`Successfull(string message)`**: 
  Emitted when a patient is successfully added or when a blood transaction is updated.

---

## Usage

To deploy and interact with the `BloodBank` smart contract:

1. **Deployment**: Deploy the contract on the Ethereum blockchain by calling the constructor. The deployer will be assigned as the owner.

2. **Registering Patients**: 
   - Call the `newPatient()` function with the required patient details. This action can only be performed by the owner.

3. **Viewing Patient Records**: 
   - Use `getPatientRecord()` to retrieve a patient's details by their government ID.
   - Use `getAllRecords()` to retrieve all patient records.

4. **Updating Blood Transactions**: 
   - Call `bloodTransaction()` with the patient's ID, transaction type, and involved addresses. Only the owner can execute this function.

---

This contract offers a robust framework for managing blood donation and transaction data on the blockchain, ensuring transparency and security in blood bank operations.
