pragma solidity ^0.5.0;

contract Adoption {
    // This creates an array of Eth addresses
    // Since adopters is public, getters are automatically created. However, since this is an array, a key (index) is needed and will only
    // return a single value.
    address[16] public adopters; 

    // Adopting a pet 
    function adopt(uint petId) public returns (uint) {
        require(petId >= 0 && petId <= 15);

        adopters[petId] = msg.sender;
        
        return petId;
    }

    // Retrieving the adopters
    // We can return 'adopters' since it is already declared, but we must specify the return type, 'address[16] memory. Memory gives the
    // data location for the variable.
    // The 'view' keyword specifies that we will not modify the state of the contract.
    function getAdopters() public view returns (address[16] memory) {
        return adopters;
    }
}