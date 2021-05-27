// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

// 定期存币合约
contract Deposit {
  // 存款单结构
  struct DepositSlip {
    // 生成时间
    uint createTime;
    // 到期时间
    uint expireDate;
    // 金额
    uint amount;
    // 是否有效
    bool valid;
  }

  // 索引计数器
  mapping (address => uint) addrCounts;

  // 存款单数据库
  mapping (address => mapping (uint => DepositSlip)) public depositSlips;

  event Log(string);

  // 以太坊定期存币
  function saveETH(uint expireDate)
  public payable returns (uint) {
    uint index = addrCounts[msg.sender];
    // depositSlips[msg.sender][index].createTime = block.timestamp;
    // depositSlips[msg.sender][index].expireDate = expireDate;
    // depositSlips[msg.sender][index].amount = msg.value;
    depositSlips[msg.sender][index] = DepositSlip({
      createTime: block.timestamp,
      expireDate: expireDate,
      amount: msg.value,
      valid: true
    });
    addrCounts[msg.sender]++;
    return index;
  }

  // 赎回以太坊定期存币
  function redemptionETH(uint index)
  public returns (bool) {
    DepositSlip storage depositSlip = depositSlips[msg.sender][index];
    require(depositSlip.valid, "Invalid deposit slip");
    require(block.timestamp >= depositSlip.expireDate, "The deposit slip is not yet due");
    payable(msg.sender).transfer(depositSlip.amount);
    depositSlip.valid = false;
    return true;
  }

  receive()
  payable external {
    payable(msg.sender).transfer(msg.value);
    emit Log("don't fuck me");
  }
}
