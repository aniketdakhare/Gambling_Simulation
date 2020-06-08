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
total_days=30
win=0
loss=0

declare -A monthly_Stake
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
			monthly_Stake[Day"$day"]=$( echo "Won 50" )
			((win++))
                else
                        monthly_Stake[Day"$day"]=$( echo "lost 50" )
			((loss++))
                fi

                total_stake=$(( $total_stake+$total_daily_stake ))
        done
}

gambling

for key in ${!monthly_Stake[@]}
do
	echo "$key : ${monthly_Stake[$key]}"
done

echo "Won $win days by $ $(($win*$limit))"
echo "Lost $loss days by $ $(($loss*$limit))"

echo "Total balance Stake is : $ $total_stake"
