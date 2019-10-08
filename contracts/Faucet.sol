pragma solidity >=0.4.21 <0.6.0;

import "openzeppelin-solidity/contracts/token/ERC20/IERC20.sol";
import "./interfaces/IPriceFeed.sol";

contract Faucet {

  IPriceFeed public priceFeed;
  IERC20 public token;

  constructor(address _priceFeed, address _token) public {
    priceFeed = IPriceFeed(_priceFeed);
    token = IERC20(_token);
  }

  function() external payable {
    token.transfer(msg.sender, msg.value * uint256(priceFeed.read()) / 10 ** 18);
  }

}
