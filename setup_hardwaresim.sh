#!/bin/bash

# This script allows to test the ros-can bridge by 
# simulating the USB-CAN device and PM08 CANbus frames

# Virtual Can set-up
modprobe vcan
ip link add dev slcan0 type vcan
ip link set up slcan0


# CANbus frames generation

i=0

while true
do
    if [ $i -eq 1 ]
    then
        uint32_t="00000B"
        int32_t="00000B"
        uint16_t="000B"
        int16_t="000B"
        uint8_t="0B"
        int8_t="0B"
        states="00"
        bool="00"

        i=0
    else
        uint32_t="00000A"
        int32_t="00000A"
        uint16_t="000A"
        int16_t="000A"
        uint8_t="0A"
        int8_t="0A"
        states="01"
        bool="01"

        i=1
    fi

        cansend slcan0 "005#${uint8_t}"
        cansend slcan0 "00A#${uint8_t}${uint8_t}${uint8_t}"
        cansend slcan0 "00C#${uint8_t}${uint16_t}"

done

