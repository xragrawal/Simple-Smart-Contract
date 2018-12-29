pragma solidity ^0.4.18;

contract BCTest {
    
    string firstName = 'Alice';
    uint age = 25;
    
    function setDetails(string _firstName, uint _age) public {
        firstName = _firstName;
        age = _age;
            }
        
    
    function getDetails() public constant returns (string, uint)
    {
        return (firstName, age);
    }
}