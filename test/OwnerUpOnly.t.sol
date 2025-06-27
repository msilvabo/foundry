// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {OwnerUpOnly} from "../src/OwnerUpOnly.sol";

contract OwnerUpOnlyTest is Test {
    OwnerUpOnly upOnly;

    event Caller(address indexed sender);

    function setUp() public {
        upOnly = new OwnerUpOnly();
    }

    function test_incrementAsOwner() public {
        vm.skip(true);
        assertEq(upOnly.count(), 0);
        upOnly.increment();
        assertEq(upOnly.count(), 1);
    }

    function test_RevertWhen_NotOwner() public {
        vm.skip(true);
        vm.prank(address(0));
        vm.expectRevert(OwnerUpOnly.Unauthorized.selector);
        upOnly.increment();
    }

    // prank    setea msg.sender para la siguiente llamada
    // no incluye llamadas a cheat code address

    function test_CallerIsOwnerPrank() public {
       vm.prank(address(1));

       vm.expectEmit(true, false, false, false);
       emit Caller(address(1));
       upOnly.incrementNotOwner();

       vm.expectEmit(true, false, false, false);
       emit Caller(address(this));
       upOnly.incrementNotOwner();
    }

    function test_CallerIsOwnerStartPrank() public {
       vm.startPrank(address(1));

       vm.expectEmit(true, false, false, false);
       emit Caller(address(1));
       upOnly.incrementNotOwner();

       vm.expectEmit(true, false, false, false);
       emit Caller(address(1));
       upOnly.incrementNotOwner();

       vm.stopPrank();

       vm.expectEmit(true, false, false, false);
       emit Caller(address(this));
       upOnly.incrementNotOwner();
    }
}
