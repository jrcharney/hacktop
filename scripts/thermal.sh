#!/bin/bash
cpuTemp0=$(cat /sys/class/thermal/thermal_zone0/temp)
cpuTemp1=$(($cpuTemp0/1000))
cpuTemp2=$(($cpuTemp0/100))
cpuTempM=$(($cpuTemp2 % $cpuTemp1))
# TODO: Add the degree symbol once we get tmux and fbterm stuff set up
# TODO: Get rid of the apostrophe in the GPU temperature readout
# TODO: what about the quad core stuff of Raspberry Pi 2?
# TODO: Color code therma temperatures. Green, yellow, orange, red. Red is bad!
cputemp=$(echo "$cpuTemp1.$cpuTempM C")
gputemp=$(/opt/vc/bin/vcgencmd measure_temp | sed -n "s/'/ /;p" | sed -n 's/temp=//p')

# echo "CPU temp=$cpuTemp1.$cpuTempM C"
# echo  GPU $gputemp
echo "CPU $cputemp GPU $gputemp"

