// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SoloToken is ERC20 {
    constructor(uint _initialSupply) ERC20("Solo", "SOL") {
        _mint(msg.sender, _initialSupply);
    }
}
