// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

// 定期存币合约
contract Deposit {
  event Log(string);

  fallback()
  external payable {
    // emit Log("get other");
  }

  // 进行以太坊定期存款
  function saveETH()
  public payable {

  }

  receive()
  payable external {
    emit Log("get eth");
  }
}