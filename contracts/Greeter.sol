//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Greeter {
//    string greet;
//
//
//    function setGreet(string memory _greet) public {
//        greet = _greet;
//    }
//
//    function getGreet() public view returns (string memory) {
//        return greet;
//    }

    address payable public owner;
    address[] public donators;

    constructor() {
        owner = payable(msg.sender);
    }

    function gatherDonation() public payable {
        require(msg.value >= .00001 ether);
        donators.push(msg.sender);
    }

    function send (address payable receiver) public payable {
        require(msg.sender == owner);
        receiver.transfer(address(this).balance);

    }

    function getBalance() public view returns(uint)
    {
        return address(this).balance;
    }


    // function transferToOwner() external{
    //   require(msg.sender == owner);
    //   owner.transfer(address(this).balance);
    // }

    function getDonators() public view returns (address[] memory){
        return donators;
    }
    // функция transferToOwner необходима для вывода средств со счета фонда на счет вла-
    // дельца. При этом средства со счета может перевести только владелец:
    // require(msg.sender == owner);.
    // Функция getDonators возвращает массив всех пожертвовавших. Таким образом получаем
    // готовый смарт-контракт
}
