//pragma solidity ^0.4.0;
pragma solidity >=0.4.22 <0.6.0;

// give your contract a name
contract getSet {
    uint age;
    string name;
    
    // declare a function that accept an input    
    function setValue(string memory _name, uint _age) public {
        age = _age;
        name = _name;
    }

    // declare a function that return an output    
    function getValue() public view returns(string memory, uint) {
        return (name, age);
    }
}
