// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract PrimitiveDataTypes {
    
    // stores a true/false 1/0 value
    // default value is false
    bool public isValid;

    function setValid(bool _isValid) public {
        isValid = _isValid;
    }

    // stores negative or positive value (256 bits)
    // default value is 0
    int public temparture;

    // stores ONLY positive value (256 bits)
    // 2**256 - 1 options
    // default value is 0
    uint public age;

    // stores ONLY positive value
    // specified the amount of bits it uses, goes from 8 till 256 in steps of 8
    // 2**8 - 1 options
    // default value is 0
    uint8 public age2;

    // way of getting minimal uint8 value, this works for all (u)int types
    uint8 public minUInt = type(uint8).min;

    // way of getting maximum uint8 value, this works for all (u)int types
    uint8 public maxUInt = type(uint8).max;

    // contains 
    string public purpose = "This is the purpose of this contract";

    function setPurpose(string memory _purpose) public {
        purpose = _purpose;
        
    }

    // address property is by default not payable, so this contact cannot interact with it
    address public addr = address(0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c);

    // this address is payable so there can be interaction with it
    // default value is 0x000...000
    address payable public payAddr = payable(0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c);
}
