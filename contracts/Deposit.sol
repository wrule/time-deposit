// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

import "./TestCoin.sol";

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

  // 事件声明
  event Log(string);

  // 存款单数据库
  mapping (address => DepositSlip[]) public depositSlips;

  // 以太坊定期存币
  function saveETH(uint expireDate)
  public payable returns (uint) {
    DepositSlip[] storage myDepositSlips = depositSlips[msg.sender];
    myDepositSlips.push(DepositSlip({
      createTime: block.timestamp,
      expireDate: expireDate,
      amount: msg.value,
      valid: true
    }));
    return myDepositSlips.length - 1;
  }

  // 赎回以太坊定期存币
  function redemptionETH(uint index)
  public returns (bool) {
    DepositSlip[] storage myDepositSlips = depositSlips[msg.sender];
    require(index < myDepositSlips.length, "Deposit slip does not exist");
    DepositSlip storage depositSlip = myDepositSlips[index];
    require(depositSlip.valid, "Invalid deposit slip");
    require(block.timestamp >= depositSlip.expireDate, "The deposit slip is not yet due");
    payable(msg.sender).transfer(depositSlip.amount);
    depositSlip.valid = false;
    return true;
  }


  // 代币定期存币
  function saveTEST(uint value, uint expireDate)
  public payable returns (uint) {
    TestCoin coin = TestCoin(0x28239aB476ca691312817a092de89E96EaaC20aE);
    bool result = coin.transferFrom(address(this), msg.sender, value);
    require(result);
    return 0;
  }


  receive()
  payable external {
    payable(msg.sender).transfer(msg.value);
    emit Log("don't fuck me");
  }
}
