// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TaxToken is ERC20 {

    // Calling the ERC20 constructor in the imported ERC20.
    constructor() ERC20("TaxToken", "TT") {

    }
}
