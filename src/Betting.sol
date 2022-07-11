// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "src/BettingERC20.sol";

contract Betting {
    /// @title an on-chain sports betting contract with Liquidity provision mechanism
    /// @author @Sam GMK
    /// @notice  contract consists of two parts: 1) Liquidity provision. 2) Betting against sporting events.
    /// Users can bet on sporting events and if they win they get paid their capital plus winnings. If 
    /// they lose to the house(smart contract) keeps their capital. The capital is then distributed  to 
    /// Liquidity Providers(LPs) relative to their share of LP tokens.
    /// @dev Owner of the contract has the power to activate fees.

    //Contract balance tracker
    uint private oldBalance;

    //stablecoin for betting. Must be an erc20.
    address public token;

    //Keeps track of total bets currently placed.
    uint private totalProfits;
    
     //re-entrancy guard
    uint private unlocked = 1;

    modifier lock() {
        require(unlocked == 1, 'BETTING: LOCKED');
        unlocked = 0;
        _;
        unlocked = 1;
    }

    //--------------------------------------EVENTS-----------------------------------------------//
    
    event Deposit(address indexed to, uint amount);
    event Withdraw();
    event Bet();

    //-------------------------------------- LP LOGIC---------------------------------------------//
    
    /// @notice user provides liquidity and LP token is minted
    /// @dev desposited amount is calculated without trusting user input i.e newBalance
    /// @param to receiving address of minted LP tokens
    function deposit(address to) lock external {
        uint _oldBalance = oldBalance; //gas savings
        uint newBalance = IERC20(token).balanceOf(address(this));
        require(newBalance > _oldBalance , "INVALID INPUT");
        uint depositedAmount = newBalance - _oldBalance;
        _mint(to, depositedAmount);
        _oldBalance = newbalance;

        emit Deposit(to,depositedAmount);
    }

    /// @notice Explain to an end user what this does
    /// @dev Explain to a developer any extra details
    /// @param Documents a parameter just like in doxygen (must be followed by parameter name)
    /// @return Documents the return variables of a contract’s function state variable
    /// @inheritdoc	Copies all missing tags from the base function (must be followed by the contract name)
    function withdraw(address to) lock external {
        uint _oldBalance = oldBalance; //gas savings


    }

    /// @notice Explain to an end user what this does
    /// @dev Explain to a developer any extra details
    /// @param Documents a parameter just like in doxygen (must be followed by parameter name)
    /// @return Documents the return variables of a contract’s function state variable
    /// @inheritdoc	Copies all missing tags from the base function (must be followed by the contract name)
    function previewProfitLosses(address LiquidityProvider) internal view returns(uint) {
        uint profit = totalWinnigs - totalLosses;
        if(profit > 0) {
           uint totalProfit = balanceOf[LiquidityProvider] + profit;
           return totalProfit;
        } else {
            return balanceOf[LiquidityProvider];
        }
    }

    //------------------------------------------Betting Logic------------------------------------------//

    /// @notice Explain to an end user what this does
    /// @dev Explain to a developer any extra details
    /// @param Documents a parameter just like in doxygen (must be followed by parameter name)
    /// @return Documents the return variables of a contract’s function state variable
    /// @inheritdoc	Copies all missing tags from the base function (must be followed by the contract name)
    function placeBet(uint32 matchId, uint8 matchResult) external lock {

    }

    
}
