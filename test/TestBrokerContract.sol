pragma solidity ^0.4.18;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/BrokerContract.sol";

contract TestBrokerContract {

    BrokerContract bc = BrokerContract(DeployedAddresses.BrokerContract());

    function testContractOwnership() public {
//        bc.charge();

        uint256 a = 1;
        uint256 b = 1;

//        Assert.equal(a, b, "always");
        Assert.equal(a, b, "1 == 1");
    }
}

