#!/bin/bash

# This script allows to test the ros-can bridge by 
# simulating the USB-CAN device and PM08 CANbus frames

# Virtual Can set-up
modprobe vcan
ip link add dev slcan0 type vcan
ip link set up slcan0


uint32_t="00000A"
int32_t="00000A"
uint16_t="000A"
int16_t="000A"
uint8_t="0A"
int8_t="0A"
states="01"
bool="01"

#cokolwiek innego niż coś z powyższych to uint8

# CANbus frames generation
while true
do
        cansend slcan0 "005#${uint8_t}${uint8_t}${states}"
        cansend slcan0 "00A#${uint8_t}${uint16_t}"
    
    done
done

