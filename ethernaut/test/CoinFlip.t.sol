// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/03-coinflip/Attack.sol";
import "../src/03-coinflip/CoinFlip.sol";


contract CoinFlipTest is Test {
    Attack public attack;
    CoinFlip public _cf;

    function setUp() public {
        _cf = new CoinFlip();
        attack = new Attack(address(_cf));
    }

    function testAttack() public {
        uint success = 0;
        vm.roll(5);
        for (uint i = 1; i <= 10; i++) {
            vm.roll(6 + i);
            bool res = attack.attack();
            if (res == true) {
                success += 1;
            }
        }
        assertEq(success, 10);
    }
}