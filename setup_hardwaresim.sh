#!/bin/bash

# This script allows to test the ros-can bridge by 
# simulating the USB-CAN device and PM08 CANbus frames

# Virtual Can set-up
modprobe vcan
ip link add dev slcan0 type vcan
ip link set up slcan0

# CANbus frames generation

devices_ids=(005 007 00A 00F 014 019 01E 023 024 025 026 027 028 02D 032 037 03C 03D 041 046 04B 050 055 05A 05F 060 064 069 06E 073 078 07D 082 087 08C 091 096 09B)

data_sent=0

while true
do
    for d_id in "${devices_ids[@]}"
    do
        if [ "$d_id" == "005" ]; then
            data_sent=`expr $data_sent + 1`
            echo "${d_id} ${data_sent}"
        fi
        #echo "${d_id}#1009AA5501"
        cansend slcan0 "${d_id}#1009AA5501"
        cansend slcan0 "${d_id}#1009AA5501020304"
    done
done