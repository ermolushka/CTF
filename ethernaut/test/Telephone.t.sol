// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/04-telephone/AttackA.sol";
import "../src/04-telephone/AttackB.sol";
import "../src/04-telephone/Telephone.sol";


contract TelephoneTest is Test {
    Telephone public telephone;
    AttackB public ab;
    AttackA public aa;

    function setUp() public {
        telephone = new Telephone();
        ab = new AttackB(address(telephone));
        aa = new AttackA(address(ab));
    }

    function testAttack() public {
        aa.attack();
        assertEq(telephone.owner(), address(ab));
    }
}