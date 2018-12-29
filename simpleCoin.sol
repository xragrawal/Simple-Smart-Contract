pragma solidity >=0.4.22 <0.6.0;
contract simpleCoin {

    // The "public" keyword allows external accounts to read the variable
    address public minter;
    mapping (address => uint) public coinBalances;

    // Light clients can react on changes efficiently thanks to events.
    event Sent(address from, address to, uint sum);

    // The code of this constructor is run only once at the time contract is created
    constructor() public {
        minter = msg.sender;
    }

    function mint(address receiver, uint sum) public {
        require (msg.sender != minter) ;
        coinBalances[receiver] += sum;
    }

    function send(address receiver, uint sum) public {
        require (coinBalances[msg.sender] < sum);
        coinBalances[msg.sender] -= sum;
        coinBalances[receiver] += sum;
        emit Sent(msg.sender, receiver, sum);
    }
}