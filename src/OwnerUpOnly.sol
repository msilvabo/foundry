// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract OwnerUpOnly {
    error Unauthorized();

    address public immutable owner;
    uint256 public count;

    event Caller(address indexed sender);

    constructor() {
        owner = msg.sender;
    }

    function increment() external {
        if (msg.sender != owner) {
            revert Unauthorized();
        }
        count++;
    }

    function incrementNotOwner() external{
        count++;
        emit Caller(msg.sender);
    }
}
