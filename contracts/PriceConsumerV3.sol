// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract PriceConsumerV3 {

    AggregatorV3Interface internal priceFeed;

    /**
     * Network: BSC Testnet (BSC)
     * Aggregator: CCToken/USD
     * Address: 0xDf117017F6BB85f74655Cf6fb0B6573A993c038a
     */
    constructor() {
        priceFeed = AggregatorV3Interface(0xDf117017F6BB85f74655Cf6fb0B6573A993c038a);
    }

    /**
     * Returns the latest price
     */
    function getLatestPrice() public view returns (uint256) {
        (
            ,int price,,,
        ) = priceFeed.latestRoundData();
        return uint256(price);
    }
}