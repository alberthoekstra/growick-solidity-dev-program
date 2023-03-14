// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract Modifiers {
    struct UserDetails {
        string name;
        uint age;
    }

    address public owner;
    mapping (address => uint) public balances;
    mapping (address => UserDetails) public userDetails;
    
    event userDetailsChanged(address account, string name, uint age);
    event balanceChanged(address account, uint balance);

    uint8 private constant Fee = 5;
    error AmountToSmall();

    constructor() {
        owner = msg.sender;
    }

    // modifier that checks if the message sender is the actual owner
    modifier onlyOwner {
        require(msg.sender == owner, "Only the owner can execute this function");
        _;
    }

    // this function accepts one argument and it saves the amount a user is depositing into a mapping
    function deposit(uint amount) public {
        require(amount > 0, "amount must be greater than 0");
        balances[msg.sender] += amount;
        emit balanceChanged(msg.sender, balances[msg.sender]);
    }

    // this function accepts one argument and it withdraws the amount a user from an users balance
    function withdraw(uint amount) onlyOwner public {
        require(amount > 0, "amount must be greater than 0");
        require(balances[msg.sender] >= amount, "Insufficient funds");
        balances[msg.sender] -= amount;
        emit balanceChanged(msg.sender, balances[msg.sender]);
    }

    // this function searches for the user balance inside the balance mapping and returns the balance of whoever is calling the contract (i.e msg.sender). 
    // This function does not accept any arguments
    function getBalance() public view returns (uint) {
        return balances[msg.sender];
    }

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

    // modifier to check if the function caller has deposit before
    modifier haveDeposit {
        require(balances[msg.sender] > 0, "You need to deposit first");
        _;
    }
    
    // modifier to check if the given amount meets the minimal requirements
    modifier checkMinimalFee(uint _amount) {
        if(_amount < Fee){
            revert AmountToSmall();
        }

        _;
    }

    function addFund(uint _amount) haveDeposit checkMinimalFee(_amount) public {
        uint newBalance = balances[msg.sender] += _amount;
        emit balanceChanged(msg.sender, newBalance);
    }
}