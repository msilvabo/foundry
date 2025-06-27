// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {
    Test,
    console
} from "forge-std/Test.sol";

contract TestSignature is Test {
    
    function testSignMessage()  public {
        vm.skip(true);
        (address alice, uint256 privatekey) = makeAddrAndKey("alice");
        emit log_address(alice);
        emit log_uint(privatekey);

        bytes32 messageHashed = keccak256("signed by Alice");
        (uint8 v, bytes32 r, bytes32 s) = vm.sign(privatekey, messageHashed);
        address signer = ecrecover(messageHashed, v,r,s);
        assertEq(signer, alice);
    }

    function testSignWalletMessage()  public {
        address alice = vm.createWallet("alice").addr;
        uint256 privatekey= vm.createWallet("alice").privateKey;
        emit log_address(alice);
        emit log_uint(privatekey);

        bytes32 messageHashed = keccak256("signed by Alice");
        (uint8 v, bytes32 r, bytes32 s) = vm.sign(privatekey, messageHashed);
        address signer = ecrecover(messageHashed, v,r,s);
        assertEq(signer, alice);
    }

}