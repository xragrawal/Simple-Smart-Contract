pragma solidity ^0.4.0;
contract Voting {

    struct Voter {
        uint weight;
        bool voted;
        uint8 vote;
        string name;
    }
    struct Proposal {
        uint voteCount;
    }

    address public chairperson;
    mapping(address => Voter) public voters;
    Proposal[] public proposals; //Leaders / Candidates / Politicians seeking vote 
    uint public numofVoters;

    /// Create a new ballot with $(_numProposals) different proposals.
    constructor(uint8 _numProposals) public {
        chairperson = msg.sender;
        voters[chairperson].weight = 1;
        proposals.length = _numProposals;
        numofVoters = 0;
    }

    /// Give $(toVoter) the right to vote on this ballot.
    /// May only be called by $(chairperson).
    function giveRightToVote(address toVoter,string _name) public {
        require(chairperson==msg.sender,"Only chairperson can add voter!!!");
        if (voters[toVoter].voted) return;
        voters[toVoter].weight = 1;
        voters[toVoter].name = _name;
        numofVoters= numofVoters + 1;
    }

    /// Give a single vote to proposal $(toProposal).
    function vote(uint8 toProposal) public {
        Voter storage sender = voters[msg.sender];
        if (sender.voted || toProposal >= proposals.length) return;
        sender.voted = true;
        sender.vote = toProposal;
        proposals[toProposal].voteCount += sender.weight;
    }

    function winningProposal() public constant returns (uint8 _winningProposal) {
        uint256 winningVoteCount = 0;
        for (uint8 prop = 0; prop < proposals.length; prop++)
            if (proposals[prop].voteCount > winningVoteCount) {
                winningVoteCount = proposals[prop].voteCount;
                _winningProposal = prop;
            }
    }
}