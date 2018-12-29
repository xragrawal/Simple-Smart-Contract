pragma solidity ^0.4.0;

contract metaCoin {
	struct coinWallet {
	uint redCoin;
	uint greenCoin;
	}
	mapping (address => coinWallet) balances;
	function metaCoin() public {
		balances[msg.sender].redCoin = 10000;
		balances[msg.sender].greenCoin = 5000;
	}
	function sendRed(address receiver, uint amount) public returns(bool successful) {
		if (balances[msg.sender].redCoin < amount) return false;
		balances[msg.sender].redCoin -= amount;
		balances[receiver].redCoin += amount;
		return true;
	}
	function sendGreen(address receiver, uint amount) public returns(bool successful) {
		if (balances[msg.sender].greenCoin < amount) return false;
		balances[msg.sender].greenCoin -= amount;
		balances[receiver].greenCoin += amount;
		return true;
	}
}