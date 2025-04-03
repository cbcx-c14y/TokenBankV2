// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC20.sol";

contract TokenBank {
  BaseERC20 public token;
  mapping(address => uint) public balances;

  constructor(address _token) {
    token = BaseERC20(_token);
  }

  function deposit(uint _amount) public {
        require(_amount > 0, "Deposit amount must be greater than 0");
        token.transferFrom(msg.sender, address(this), _amount);
        balances[msg.sender] += _amount;
    }

    function withdraw(uint _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance to withdraw");
        balances[msg.sender] -= _amount;
        token.transfer(msg.sender, _amount);
    }
}
