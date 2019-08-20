pragma solidity >=0.5.11 <0.6.0;

/// @title GEO Protocol observers price proposes contract.
///
/// This contract implements simple mechanics for the observers,
/// that allows them to porpose price for the CT (certificate tokens).
///
/// From the contract perspective of view,
/// ANY ethereum address is able to propose any uint256 value.
/// No validation is perfrmed onin the contract.
/// All validation is expexted to be executed on the observers chain.
contract ObserversPriceProposesVoting {
    
    event PriceProposed(
        address observer,
        uint256 proposedPrice
    );
    
    mapping(address => uint256) public proposes;
    
    /// @notice REWRITES proposed `price` for the CT.
    /// Emits event about new price proposed.
    function rewritePropose(uint256 price) public {
        proposes[msg.sender] = price;
        
        emit PriceProposed(msg.sender, price);
    }
}

