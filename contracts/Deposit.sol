// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

// 定期存币合约
contract Deposit {
  event Log(string);

  fallback()
  external payable {
    emit Log("get other");
  }

  receive()
  payable external {
    emit Log("get eth");
  }
}
