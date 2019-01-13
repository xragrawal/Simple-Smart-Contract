// A simple bank smart contract where the user can deposit and query funds.
pragma solidity >=0.4.22 <0.6.0;

contract SimpleBank {
    
    // this declares a key/value array called balanceAccount.
    // the key is address and the value is an unsigned integer
    mapping (address => uint) balanceAccount;
    address public banker = msg.sender;

    // Declare a deposit function that takes an input called amount
    function deposit(uint amount) public {
        require (msg.sender == banker, "Only banker can make a deposit");
        // add amount to the balance of the sender
        balanceAccount[msg.sender] += amount;
    }
    
    // a getBalance function that accepts no inputs but returns
    // the amount in the balanceAccount array
    function getBalance() public view returns (uint balance){
        return balanceAccount[msg.sender];
    }
}
