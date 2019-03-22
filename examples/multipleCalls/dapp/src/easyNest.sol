pragma solidity >=0.5.0;
contract Callee {
  uint temperature = 0;
  function tempDelta(uint x) public {
      temperature = add(temperature, x);
      require(false);
  }
  
  function add(uint x, uint y) internal pure returns (uint z) {
    z = x + y;
    require(z >= x);
  }
}

contract easyNest {
    Callee callee;
    function raiseTemp(uint x) public {
        // callee.tempDelta(x);
        assembly {
            mstore(0, 0x75657f1500000000000000000000000000000000000000000000000000000000)
            mstore(4, calldataload(4))
            let v := call(gas, sload(0), 0, 0, 36, 0, 0)
            stop()
        }
  }
}
