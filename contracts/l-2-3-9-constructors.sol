// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract ConstructorA {
    address immutable owner;
    uint FEE;

    constructor(uint _fee){
        owner = msg.sender;
        FEE = _fee;
    }
}

contract ConstructorB is ConstructorA {
    constructor() ConstructorA(20) {
    }

    function getOwner() public view returns (address) {
        return owner;
    }

    function getFee() public view returns (uint) {
        return FEE;
    }
}
