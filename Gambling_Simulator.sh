#!/bin/bash

echo "Welcome to Gambling Simulator Program "

DAILY_STAKE=100
BET=1
WON=1
percent=50
limit=$(( $percent*$DAILY_STAKE/100 ))
max_limit=$(( $DAILY_STAKE+$limit ))
min_limit=$(( $DAILY_STAKE-$limit ))
total_stake=0
total_days=20

function gambling()
{
	for ((day=1; day<=$total_days; day++))
	do
		total_daily_stake=$DAILY_STAKE

	        while (( $total_daily_stake > $min_limit && $total_daily_stake < $max_limit ))
        	do
                	check=$((RANDOM%2))

                	if [ $check -eq $WON ]
                	then
                        	total_daily_stake=$((total_daily_stake+BET))
                	else
                        	total_daily_stake=$((total_daily_stake-BET))
                	fi
        	done

        	if [ $total_daily_stake -gt $DAILY_STAKE ]
		then
			echo "Won on Day$day with total amount $ $total_daily_stake "
		else
			echo "Lost on Day$day with total amount $ $total_daily_stake "
		fi

	        total_stake=$(( $total_stake+$total_daily_stake ))
	done
}

gambling

echo "Total balance Stake is : $ $total_stake"
