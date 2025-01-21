//SPDX-License-Identifier: UNLICENSED
pragma solidity >= 0.7.0 < 0.9.0;
contract lottery{
    address public owner;
    address payable[] public players;
    constructor(){
        owner = msg.sender;
    }
    receive() payable external{
        require(msg.sender == owner);
        players.push(payable(msg.sender));
    }
    function getbalance() public view returns(uint){
        require(msg.sender == owner,"you are not the owner.");
        return address(this).balance;
    }
    function random() internal  view returns(uint){
        return uint(keccak256(abi.encodePacked(block.prevrandao,block.timestamp,players.length)));

    }
    function pickwinner() public{
        require(msg.sender == owner);
        require(players.length >= 3);
        address payable winner;
        uint r = random();
        uint index = r % players.length;
        winner = players[index];
        winner.transfer(getbalance());
        players = new address payable[](0);

    }
}