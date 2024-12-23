// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TaxToken is ERC20 {
    // 10% tax
    uint256 taxDivisor = 10;

    // Calling the ERC20 constructor in the imported ERC20.
    constructor() ERC20("TaxToken", "TT") {}

    function mintToMe(uint256 amount) public {
        _mint(msg.sender, amount);
    }

    function transfer(address to, uint amount) public override returns (bool) {
        // Get the balance of the address calling the contract.
        uint balanceSender = balanceOf(msg.sender);
        // Check if the balance of the sender( address calling the contract) is greater than the amount to be transferred.
        require(balanceSender >= amount, "Insufficient balance to transer!");

        // Get the tax amount(10% of the amount to be transfered)
        uint taxAmount = amount / taxDivisor;
        // AMount to be transferred
        uint transferAmount = amount - taxAmount;

        _transfer(msg.sender, to, transferAmount);
        _transfer(msg.sender, "0x00000dEaD", taxAmount);

        // // Subract the transfer amount from the sender's balance
        // _balances[msg.sender] -= amount;
        // // Add the amoun tto the balance of the recipient
        // _balances[to] += amount;

        return true;
    }
}
