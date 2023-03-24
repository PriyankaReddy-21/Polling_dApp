// SPDX-License-Identifier: MIT
 pragma solidity ^0.8.16;

/* Simple polling implementation */

contract Polling{

string public Question;
address [10] participants;
mapping (address => bool) internal addrExists;
uint count = 0;
uint yes_num = 0;
uint no_num = 0;
uint maybe_num = 0;

constructor(string memory _question){
    Question = _question;
}

function Yes () public {
    require (count < 10, "Poll is closed, please check result");
    require (addrExists[msg.sender] == false, "You have already given your input");
    yes_num++;
    participants[count] = msg.sender;
    addrExists[msg.sender] = true;
    count++;
}

function No () public {
    require (count < 10, "Poll is closed, please check result");
    require (addrExists[msg.sender] == false, "You have already given your input");
    no_num++;
    participants[count] = msg.sender;
    addrExists[msg.sender] = true;
    count++;
}

function Maybe () public {
    require (count < 10, "Poll is closed, please check result");
    require (addrExists[msg.sender] == false, "You have already given your input");
    maybe_num++;
    participants[count] = msg.sender;
    addrExists[msg.sender] = true;
    count++;
}


function showResult() public view returns (string memory, uint, string memory, uint, string memory, uint){
return ("Yes", yes_num, "No", no_num, "Maybe", maybe_num);
}

}