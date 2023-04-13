pragma solidity ^0.6.4;
contract Faucet {
    address payable owner;
    //constructor is only called once, upon deploying the contract
    constructor() public {
        //sets the owner to the address that sent the tx which deployed the contract.
        //msg represents the tx that publishes this contract. Sender is the public key that sent it
        owner = msg.sender;
    }
//this is used as a "template" that other functions can insert themselves into
modifier onlyOwner {
    require(msg.sender == owner);
    // the _; indicates where the code within the function that calls this modifier will be inserted
    _;
}

    receive() external payable {}
//this selfdestruct function calls the onlyOwner modifier, and will insert itself at _;
    function destroy() public onlyOwner {
        selfdestruct(owner);
    }

    function withdraw(uint withdraw_amount) public {
        require(withdraw_amount <= 0.1 ether);
    }
    msg.sender.transfer(withdraw_amount);
}