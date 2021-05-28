// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

import "./TestCoin.sol";

// 测试合约
contract Test {
  function Send()
  public returns(bool) {
    TestCoin coin = TestCoin(0x28239aB476ca691312817a092de89E96EaaC20aE);
    coin.transfer(0x5b798Cb4f7aa23af9856420921A2AA782Ee96840, 1e11);
    return true;
  }
}
