pragma solidity ^0.4.18;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/BrokerContract.sol";

contract TestBrokerContract {


    // Testing the adopt() function
    function testContractOwnership() public {
        BrokerContract bc = BrokerContract(DeployedAddresses.BrokerContract());

        bc.charge();

        address a = 0;
        address b = 0;

//        Assert.equal(a, b, "always");
        Assert.equal(bc.getBalance(tx.origin), a, "Contract should be owned by");
    }
}

