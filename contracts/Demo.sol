// 

pragma solidity ^0.8.10;

contract Shop {

    //0xd9145CCE52D386f254917e481eB44e9943F39138   
    address public owner;
    //хранилище 
    mapping (address => uint) public payments;

    //сохраняем владельца 
    constructor() {
    //sender отправляет адресс отправителю 
        owner = msg.sender;
    }
    // payable модификатор , если не помечена, то деньги принимать не будет 
    function payForItem() public payable {
        payments[msg.sender] = msg.value;
    }

    //списываем все денежные средства 
    function withdrawAll() public {
        address payable _to = payable(owner);
        address _thisContract = address(this);
        _to.transfer(_thisContract.balance);
    }
}