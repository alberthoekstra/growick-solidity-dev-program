// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract Mappings {

    event balanceChanged(address account, uint balance);

    mapping (address => uint) public balances;
    
    // this function accepts one argument and it saves the amount a user is depositing into a mapping
    function deposit(uint amount) public {
        require(amount > 0, "amount must be greater than 0");
        balances[msg.sender] += amount;
        emit balanceChanged(msg.sender, balances[msg.sender]);
    }

    // this function accepts one argument and it withdraws the amount a user from an users balance
    function withdraw(uint amount) public {
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
}