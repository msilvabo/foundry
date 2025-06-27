// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console.sol";

contract University {
    uint256 public starDate = block.timestamp + 1 days;
    uint256 public  endDate = block.timestamp + 2 days;

    function enroll() public view {
        require(block.timestamp >= starDate && block.timestamp < endDate, "cannnot enroll");
    }

    function leave() public view{
        require(block.timestamp >= endDate, "cannot leave");
    }
}