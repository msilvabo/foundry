// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console.sol";

contract ExpectEmit {
    event Transfer(address indexed from, address indexed to, uint256 amount);

    // Función que solo emite el evvennto Transfer
    function t() public {
        emit Transfer(msg.sender, address(1234), 1000);
    }
}
