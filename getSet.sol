pragma solidity >=0.4.22 <0.6.0;
//pragma solidity ^0.4.0;

contract getSet {
    uint age;
    string name;
    
    
    function setValue(string memory _name, uint _age) public {
        age = _age;
        name = _name;
    }
    
    function getValue() public view returns(string memory, uint) {
        return (name, age);
    }
}