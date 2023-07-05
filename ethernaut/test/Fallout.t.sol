// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/02-fallout/Attack.sol";
import "../src/02-fallout/Fallout.sol";


contract FalloutTest is Test {
    Attack public attack;
    Fallout public _fallout;

    function setUp() public {
        _fallout = new Fallout();
        attack = new Attack{value: 2e18}(payable(address(_fallout)));
    }

    function testAttack() public {
        attack.attack();
        assertEq(_fallout.owner(), address(attack));
    }
}