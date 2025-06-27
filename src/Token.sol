// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "solmate/tokens/ERC20.sol" as sol;

contract Token is sol.ERC20{
    constructor() sol.ERC20("Fonudry Esp", "FES",18){
    }

}

import "@openzeppelin/contracts/token/ERC20/ERC20.sol" as oz;

contract TokenOz is oz.ERC20{
    constructor() oz.ERC20("Fonudry Esp", "FES"){

    }

}