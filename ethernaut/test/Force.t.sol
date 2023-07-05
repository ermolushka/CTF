// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/07-force/Attack.sol";
import "../src/07-force/Force.sol";


contract FalloutTest is Test {
    Attack public attack;
    Force public force;

    function setUp() public {
        force = new Force();
        attack = new Attack(force);
    }

    function testAttack() public {
        attack.attack{value: 1e18}();
        assert(address(force).balance > 0);
    }
}