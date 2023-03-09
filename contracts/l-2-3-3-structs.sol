// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract Mappings {
    struct UserDetails {
        string name;
        uint age;
    }

    event userDetailsChanged(address account, string name, uint age);

    mapping (address => UserDetails) public userDetails;

    // this function accepts 2 arguments that represent the details of the user calling the smart contract and it saves them into a defined struct
    function setUserDetails(string calldata name, uint age) public {
        require(bytes(name).length > 0, "name cannot be empty");
        require(age > 0 , "age should be greater than 0");
        userDetails[msg.sender] = UserDetails(name, age);
        emit userDetailsChanged(msg.sender, name, age);
    }

    function deleteUserDetails() public {
        delete userDetails[msg.sender];
    }

    // this function retrieves and returns the details saved for the user calling the contract
    function getUserDetails() public view returns (string memory name, uint age){
        UserDetails memory details = userDetails[msg.sender];
        return (details.name, details.age);
    }
}