pragma solidity ^0.4.18;

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
    address public owner;


    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);


    /**
     * @dev The Ownable constructor sets the original `owner` of the contract to the sender
     * account.
     */
    function Ownable() public {
        owner = msg.sender;
    }


    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }


    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0));
        OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }

}


/**
 * @title Destructible
 * @dev Base contract that can be destroyed by owner. All funds in contract will be sent to the owner.
 */
contract Destructible is Ownable {

    function Destructible() public payable {}

    /**
     * @dev Transfers the current balance to the owner and terminates the contract.
     */
    function destroy() onlyOwner public {
        selfdestruct(owner);
    }

    function destroyAndSend(address _recipient) onlyOwner public {
        selfdestruct(_recipient);
    }
}

contract BrokerContract is Destructible {

    event Log(string _string, uint256 _uint256);

    function() payable public {
        require(msg.value > 0);

        address a_1 = 0x51EcdA39Ef0D6a8BF53a1ceF41239d63a4EdC1f7;
        address a_2 = 0x8B2dF0EDccD50FF8f775bef0E7D8C980C8112c49;

        Log("got_paid", msg.value);

        a_1.transfer(msg.value * 85 / 100);
        a_2.transfer(this.balance);
    }

    function charge() onlyOwner payable public {
        require(msg.value > 0);

        Log("charging", msg.value);
        Log("balance", this.balance);
    }

}