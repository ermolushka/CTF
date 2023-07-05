// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./AttackB.sol";


contract AttackA {
    AttackB ab;

    constructor(address _ab) {
        ab = AttackB(_ab);
    }

    function attack() public {
        ab.attack();
    }
}