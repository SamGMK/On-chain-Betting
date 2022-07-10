// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Betting {
    /// @title an on-chain sports betting contract with Liquidity provision mechanism
    /// @author @Sam GMK
    /// @notice  contract consists of two parts: 1) Liquidity provision. 2) Betting against sporting events.
    /// Users can bet on sporting events and if they win they get paid their capital plus winnings. If 
    /// they lose to the house(smart contract) keeps their capital. The capital is then distributed  to 
    /// Liquidity Providers(LPs) relative to their share of LP tokens.
    /// @dev Owner of the contract has the power to activate fees.

    //--------------------------------------EVENTS-----------------------------------------------//
    event Deposit();
    event Withdraw();
    event Bet();

    //-------------------------------------- LP LOGIC---------------------------------------------//
    
    /// @notice Explain to an end user what this does
    /// @dev Explain to a developer any extra details
    /// @param Documents a parameter just like in doxygen (must be followed by parameter name)
    /// @return Documents the return variables of a contract’s function state variable
    /// @inheritdoc	Copies all missing tags from the base function (must be followed by the contract name)
    function deposit() public {}

    /// @notice Explain to an end user what this does
    /// @dev Explain to a developer any extra details
    /// @param Documents a parameter just like in doxygen (must be followed by parameter name)
    /// @return Documents the return variables of a contract’s function state variable
    /// @inheritdoc	Copies all missing tags from the base function (must be followed by the contract name)
    function withdraw() public {}
}
