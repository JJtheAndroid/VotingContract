// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;


contract Voting {



//this line assigns a message for the each situation
string public result;


uint Votebegins = block.timestamp;
uint VoteEnds = block.timestamp + 3 days;


//this line assigns a variable to each proposal
uint public ProposalA;
uint public  ProposalB;




//this line makes sure that each voter can only vote once 
mapping (address => bool) public registered;





//This function creates a voting function for Proposal A

function VoteforProposalA (bool) public {
require (registered[msg.sender] == false, "You have already voted");
require (VoteEnds> Votebegins, "The Election is over");

ProposalA++;

registered[msg.sender] = true;

}

//This function creates a voting function for Proposal B
function VoteforProposalB (bool) public {
require (registered[msg.sender] == false, "You have already voted");
require (VoteEnds> Votebegins, "The Election is over");

ProposalB++;

registered[msg.sender] = true;

}


function TimelefttoVote () public view returns (uint) {

return VoteEnds - block.timestamp;

}





function ReturnWinningProposal() public returns (string memory _result){

if (VoteEnds < Votebegins){



    if (ProposalA > ProposalB){

        result = "Proposal A has won!";
        return result;
    } 
    
    else if (ProposalB > ProposalA){

       result  = "Proposal B has won!";
        return result;
    }
    else {

       result  = " No decision has been made";
        return result;
    }

     

}

}


}
