// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {PriceConverter} from "./PriceConverter.sol";
contract FundMe {

    using PriceConverter for uint256;
    uint256 public constant minimumUsd = 5e18;
    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;
    function fund() public  payable {

        // 1e18 = 1 ETH = 1000000000000000000WEI
        require(msg.value.getConversionRate() >= minimumUsd ,"Not enough etherium");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value ;
    }


}