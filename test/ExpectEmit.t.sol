// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {
    Test,
    console
} from "forge-std/Test.sol";
import {ExpectEmit} from "../src/ExpectEmit.sol";

contract ExpectEmitTest is Test {
    event Transfer(address indexed from, address indexed to, uint256 amount);

    function test_ExpectEmit() public {
        ExpectEmit emitter = new ExpectEmit();
        vm.expectEmit(true, true, false, true);
        emit Transfer(address(this), address(1234), 1000);
        emitter.t();
    }

    function test_ExpectEmit_DotCheckData() public {
        ExpectEmit emitter = new ExpectEmit();
        vm.expectEmit(true, true, false, false);
        emit Transfer(address(this), address(1234), 1001);
        emitter.t();
    }
}
