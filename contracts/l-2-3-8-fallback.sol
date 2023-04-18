// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract Fallback {
    event log(string method, address sender, uint value);

    // this method gets called when the msg.data is empty or receive() does not exist
    fallback() external payable{
        emit log("fallback", msg.sender, msg.value);
    }

    // this method gets called when the msg.data is not empty
    receive() external payable{
        emit log("receive", msg.sender, msg.value);
    }
}
