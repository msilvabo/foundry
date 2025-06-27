// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console.sol";

contract Wallet {

    event Deposited(address indexed sender);
    address private owner;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only Owner");
        _;
    }

    receive() external payable{
        emit Deposited(msg.sender);
    }

    function withdrawAll() onlyOwner external {
        payable(owner).transfer(address(this).balance);
    }

    function getOwner() public view returns(address){
        return owner;
    }
    
    function setOwner(address _address)  onlyOwner external {
        owner = _address;
    }
}