// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/01-fallback/Attack.sol";
import "../src/01-fallback/Fallback.sol";
import "forge-std/console.sol";


contract FallbackTest is Test {
    Attack public attack;
    Fallback public _fb;

    function setUp() public {
        _fb = new Fallback();
        attack = new Attack{value: 2e18}(payable(address(_fb)));
    }

    function testAttack() public {
        attack.attack();
        assertEq(_fb.owner(), address(attack));
    }
}