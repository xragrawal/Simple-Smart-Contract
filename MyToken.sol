//pragma solidity ^0.4.1;
pragma solidity >=0.4.22 <0.6.0;

contract MyToken {
    mapping (address => uint) public balanceOf;

    event LogTxfMade(address, address, uint);

   // Initializes contract with initial supply tokens to the creator of the contract
   constructor (uint256 initialSupply) public  {
       // Give the creator all initial tokens 
       balanceOf[msg.sender] = initialSupply;   
        }

   // Transfer Tokens
   function transfer(address _to, uint256 _value) public {

    // Check if the sender has enough
    require(balanceOf[msg.sender] >= _value, "Sender do not have enough tokens");

    // Check for overflows
    require(balanceOf[_to] + _value >= balanceOf[_to], "Total exceed initial supply"); 

    // Subtract from the sender
    balanceOf[msg.sender] -= _value;     

    // Add the same to the recipient               
    balanceOf[_to] += _value;                           
    emit LogTxfMade(msg.sender, _to, _value);

    }
}
