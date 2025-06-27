// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {University} from "../src/University.sol";

contract UniversityTest is Test{
    University public university;
    uint256 private starDate;

    function setUp() public{
        university = new University();
        starDate = block.timestamp;
    }

    // warp -- establecer block.timestamp
    // skip -- incrementar el tiempo actual en segundos
    // rewind - reducir el tiempo actual en segundos

    function testEnrollFailBeforeStartDate() public {
        vm.expectRevert("cannnot enroll");
        university.enroll();
    }

    function testEnrollFailBeforeEndDate() public {
        vm.expectRevert("cannnot enroll");
        vm.warp(starDate + 2 days);
        university.enroll();
    }

    function testEnroll() public{
        vm.warp(starDate + 1 days);
        university.enroll();
    }

    function testLKeave() public {
        vm.warp(starDate + 2 days);
        university.leave();
    }


    function testSkip() public {
        console.logUint(block.timestamp);
        vm.warp(0);
        assertEq(block.timestamp, 0);
        skip(3600);
        assertEq(block.timestamp, 3600);
    }

    function testReqiind() public {
        uint256 t = block.timestamp;
        rewind(1);
        assertEq(block.timestamp, 0);
    }
}