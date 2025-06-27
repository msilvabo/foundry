// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console.sol";

contract Counter {
    uint256 private counter;

    function getCounter() public view returns (uint256) {
        return counter;
    }

    function increment() public {
        counter += 1;
        console.log("Next value: %s", counter);
    }

    function decrement() public {
        require(counter > 0, "Counter is zero");
        counter -= 1;
    }
}
