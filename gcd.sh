#!/bin/bash
#set -x
gcd() {
	local a=$1
	local b=$2

	while [ $b -ne 0 ]; do
		local temp=$b
		b=$((a % b))
		a=$temp
	done

	echo $a
}

lcm() {
	local a=$1
	local b=$2

	local gcd=$(gcd $a $b)

	local lcm=$(( a * b / gcd))

	echo "lcm $lcm"
}

read -p "enter two numbers " a
read b
echo "gcd  $(gcd $a $b)"
lcm $a $b


