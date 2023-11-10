#!/bin/bash

c1=0
c2=0
c3=0
c4=0
c5=0
c6=0
c7=0
c8=0
c9=0

player=1

print_field() {
	local arr=($c1 $c2 $c3 $c4 $c5 $c6 $c7 $c8 $c9)
	local brr=(' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ')
	for ((i=0;i<9;i++))
	do
		if [ ${arr[$i]} -eq 1 ]
		then
			brr[$i]='X'
		elif [ ${arr[$i]} -eq 2 ]
		then
			brr[$i]="0"
		fi
	done
	echo "${brr[0]} | ${brr[1]} | ${brr[2]}"
	echo "${brr[3]} | ${brr[4]} | ${brr[5]}"
	echo "${brr[6]} | ${brr[7]} | ${brr[8]}"
}


#t=$(leo run test | grep -E -o '[0-9]+u[0-9]+' | sed 's/[^0-9]*\([0-9]\+\)u.*/\1/')
#q=$((t))

print_field

while true
do
	ui=0
	fl=0
	read ui
	if [ $ui -eq 1 -a $c1 -eq 0 ]
	then
		c1=$player
		fl=1
	elif [ $ui -eq 2 -a $c2 -eq 0 ]
	then
		c2=$player
		fl=1
	elif [ $ui -eq 3 -a $c3 -eq 0 ]
	then
		c3=$player
		fl=1
	elif [ $ui -eq 4 -a $c4 -eq 0 ]
	then
		c4=$player
		fl=1
	elif [ $ui -eq 5 -a $c5 -eq 0 ]
	then
		c5=$player
		fl=1
	elif [ $ui -eq 6 -a $c6 -eq 0 ]
	then
		c6=$player
		fl=1
	elif [ $ui -eq 7 -a $c7 -eq 0 ]
	then
		c7=$player
		fl=1
	elif [ $ui -eq 8 -a $c8 -eq 0 ]
	then
		c8=$player
		fl=1
	elif [ $ui -eq 9 -a $c9 -eq 0 ]
	then
		c9=$player
		fl=1
	fi
	if [ $fl -eq 1 ]
	then
		if [ $player -eq 1 ]
		then
			player=2
		else
			player=1
		fi
	fi
	ws=$(leo run check_for_win "{ r1: { c1: $((c1))u8, c2: $((c2))u8, c3: $((c3))u8 }, r2: { c1: $((c4))u8, c2: $((c5))u8, c3: $((c6))u8 }, r3: { c1: $((c7))u8, c2: $((c8))u8, c3: $((c9))u8 } }" | grep -E -o '[0-9]+u[0-9]+' | sed 's/[^0-9]*\([0-9]\+\)u.*/\1/')
	w=$((ws))
	fs=$(leo run is_full "{ r1: { c1: $((c1))u8, c2: $((c2))u8, c3: $((c3))u8 }, r2: { c1: $((c4))u8, c2: $((c5))u8, c3: $((c6))u8 }, r3: { c1: $((c7))u8, c2: $((c8))u8, c3: $((c9))u8 } }" | grep -E -o '[0-9]+u[0-9]+' | sed 's/[^0-9]*\([0-9]\+\)u.*/\1/')
	f=$((fs))
	if [ $w -ne 0 ]
	then
		echo "Player $ws win"
		break
	elif [ $f -ne 0 ]
	then
		echo "Draw"
		break
	else
		echo "Player $player step"
	fi
	print_field
done
print_field