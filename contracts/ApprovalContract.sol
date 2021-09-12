// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ApprovalContract {
  // visible externally and internally 
  address public sender;
  address payable public receiver;
  address public constant approver = 0x2b8Bbad1879Ef83E65F3b1793F6B86ADAEF3482C;

  // external: this function only visible externally
  // payable: this function can receive Ether together with a call
  function deposit(address payable _receiver) external payable {
    require(msg.value > 0);
    sender = msg.sender;
    receiver = _receiver;
  }

  // pure disallows modification or access of state
  function viewApprover() external pure returns(address) {
    return(approver);
  }

  function approve() external {
    // ensure that this function is called by the approver (constant)
    require(msg.sender == approver);
    // this should be read as "transfer this (contract's) balance to the receiver"
    // receiver.transfer(address(this).balance);
    bool sent = receiver.send(address(this).balance);
    require(sent, "Failed to send Ether");
  }

}
