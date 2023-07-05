// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/05-token/Token.sol";
import "../src/05-token/Attack.sol";


contract TokenTest is Test {
    Token public token;
    Attack public attack;
    address user = address(10);

    function setUp() public {
        token = new Token(20);
        attack = new Attack(address(token));  
    }

    function testAttack() public {
        token.transfer(user, 20);  
        vm.startPrank(address(1));
        attack.attack(user);
        console.log(token.balanceOf(user));
        assertEqUint(token.balanceOf(user), 2**256-1);
    }
}