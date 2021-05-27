// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

// 定期存币合约
contract Deposit {
  event Log(string);
  event Log(uint256);
  event LogBytes(bytes);

  fallback()
  external payable {
    // emit Log("get other");
  }

  // 进行以太坊定期存款
  function saveETH()
  public payable {
    emit Log("saveETH2");
    emit Log(block.timestamp);
    emit Log(msg.value);
    emit LogBytes(msg.data);
  }

  receive()
  payable external {
    payable(msg.sender).transfer(msg.value);
    emit Log("don't fuck me");
  }
}
