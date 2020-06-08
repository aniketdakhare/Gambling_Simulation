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
total_Won=0

declare -A monthly_Stake
declare -A Daily_collection

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
			total_Won=$(( $total_Won+$limit ))
                        monthly_Stake[Day"$day"]="Won 50"
			Daily_collection[Day"$day"]=$(( total_Won ))
                        ((win++))
                else
			total_Won=$(( $total_Won-$limit ))
                        monthly_Stake[Day"$day"]="lost 50"
                        ((loss++))
			Daily_collection[Day"$day"]=$(( total_Won ))
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

lucky=0
unlucky=$total_stake

function check_luck()
{
	for key in ${!Daily_collection[@]}
	do
        	if [ ${Daily_collection[$key]} -eq $lucky ]
        	then
                	echo "$key is luckiest day with total winning amount $ ${Daily_collection[$key]} "
        	elif [ ${Daily_collection[$key]} -eq $unlucky ]
        	then
                	echo "$key is unluckiest day with amount $ ${Daily_collection[$key]} "
        	fi
	done

}

function lucky_unluky_day()
{
	for key in ${!Daily_collection[@]}
	do
		if [ ${Daily_collection[$key]} -gt $lucky ]
		then
			lucky=${Daily_collection[$key]}
		fi

		if [ ${Daily_collection[$key]} -lt $unlucky ]
		then
			unlucky=${Daily_collection[$key]}
		fi
	done
	check_luck
}
lucky_unluky_day

echo "Total balance Stake is : $ $total_stake"
