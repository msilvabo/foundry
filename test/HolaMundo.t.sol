// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {HolaMundo} from "../src/HolaMundo.sol";

contract HolaMundoTest is Test {
    HolaMundo public holaMundo;

    function setUp() public {
        holaMundo = new HolaMundo();
    }

    function testSaludo() public view {
        assertEq(holaMundo.saludo(), "Hola Mundo!");
    }
}
