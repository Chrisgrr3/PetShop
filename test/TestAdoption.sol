pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

// We import Assert.sol because it gives us various assertions to use in our tests, which check for things like equality, inequality or
// emptiness to return a pass/fail from our test.

// We imported DeployedAddresses.sol because when running tests, Truffle will deploy a fresh instance of the contract being tested to the
// blockchain. This smart contract gets the address of the deployed contract.

// Adoption.sol is the smart contract we want to test.
contract TestAdoption {

    // The address of the adoption contract to be tested
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    // Testing the adopt() function
    function testUserCanAdoptPet() public {
        uint returnedId = adoption.adopt(expectedPetId);

        Assert.equal(returnedId, expectedPetId, "Adoption of the expected pet should match what is returned.");
    }

    // Testing retrieval of a single pet's owner
    function testGetAdopterAddressByPetId() public {
        address adopter = adoption.adopters(expectedPetId);

        Assert.equal(adopter, expectedAdopter, "Owner of the expected pet should be this contract");
    }

    // Testing retrieval of all pet owners
    function testGetAdopterAddressByPetIdInArray() public {
        // Store adopters in memory instead of the contract's storage
        address[16] memory adopters = adoption.getAdopters();

        Assert.equal(adopters[expectedPetId], expectedAdopter, "Owner of the expected pet should be this contract");
    }

    // The id of the pet that will be used for testing
    uint expectedPetId = 8;

    // The expected owner of adopted pet is this contract (the testing contract)
    address expectedAdopter = address(this);
}