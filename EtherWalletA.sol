// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract EtherWallet {
    address payable public owner;
    address payable public user;
   

    constructor() {
        owner = payable(msg.sender);
    }

    // receive() external payable {}

    function deposit() external payable {
        
    }

    function withdraw(uint _amount) external {
        require(msg.sender == owner , "caller is not owner");
        payable(msg.sender).transfer(_amount);
    }

    function userWithdrawal(uint _amount) external payable{
        require(msg.sender == user , "caller is not user");
        require(msg.value <= _amount, "User can not withdraw more than amount deposited");
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}