#!/bin/bash

echo "Welcome to Gambling Simulator Program "

DAILY_STAKE=100
BET=1
WON=1
percent=50
limit=$(( $percent*$DAILY_STAKE/100 ))
max_limit=$(( $DAILY_STAKE+$limit ))
min_limit=$(( $DAILY_STAKE-$limit ))
total_stake=$DAILY_STAKE

function gambling()
{
	while (( $total_stake > $min_limit && $total_stake < $max_limit ))
	do
		check=$((RANDOM%2))
		if [ $check -eq $WON ]
		then
			total_stake=$((total_stake+BET))
        	else
                	total_stake=$((total_stake-BET))
        	fi
	done
	echo "Done for the day..."
}

gambling

echo "Total Stake is : $total_stake"
