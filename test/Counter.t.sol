// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";
import {HelperContract} from "../src/HelperContract.sol";

contract CounterTest is Test, HelperContract {
    Counter public counter;
    uint256 testNumber;
    address important_address;

    function setUp() public {
        testNumber = 42;
        counter = new Counter(); // ✅ Se inicializa correctamente
        important_address = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    }

    function test_important_addresss() public view {
        assertEq(important_address, HelperContract.IMPORTANT_ADDRESS);
    }

    function test_Numberis42() public view {
        assertEq(testNumber, 42);
    }

    function test_Revert_When_Counter_IsZero() public {
        vm.expectRevert(bytes("Counter is zero")); // o simplemente: vm.expectRevert();
        counter.decrement(); // ✅ Ahora sí se ejecuta contra un contrato válido
    }

    function test_GetCounter() public view {
        uint256 counterValue = counter.getCounter();
        assertEq(counterValue, 0);
    }

    function testIncrement() public {
        counter.increment();
        console.log("print ----");
        uint256 counterValue = counter.getCounter();
        assertEq(counterValue, 1);
    }

    function test_Reverse_decrement() public {
        vm.expectRevert(bytes("Counter is zero"));
        counter.decrement();
    }
}
