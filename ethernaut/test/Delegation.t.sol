// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/06-delegation/Attack.sol";
import "../src/06-delegation/Delegate.sol";
import "../src/06-delegation/Delegation.sol";

import "forge-std/console.sol";


contract DelegationTest is Test {
    Attack public attack;
    Delegate public delegate;
    Delegation public delegation;
    address owner = address(1);

    function setUp() public {
        delegate = new Delegate(owner);
        delegation = new Delegation(address(delegate));
        attack = new Attack(address(delegation));
    }

    function testFailOwner() public {
        vm.expectRevert();
        assertEq(delegate.owner(), owner);
    }

    function testAttack() public {
        vm.prank(owner);
        attack.attack();
        assertEq(delegate.owner(), owner);
    }
}