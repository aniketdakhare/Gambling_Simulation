#!/bin/bash -x

echo "Welcome to Gambling Simulator Program "

DAILY_STAKE=100
BET=1
WON=1

function gambling()
{
	check=$((RANDOM%2))
	if [ $check -eq $WON ]
	then
		DAILY_STAKE=$(( DAILY_STAKE+BET ))
		echo "Won"
        else
                DAILY_STAKE=$(( DAILY_STAKE-BET ))
                echo "Lost"
        fi
}

gambling

echo "Total Stake is : $DAILY_STAKE"
