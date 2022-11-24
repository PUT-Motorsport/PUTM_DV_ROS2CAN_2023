#!/bin/bash

# This script allows to test the ros-can bridge by 
# simulating the USB-CAN device and PM08 CANbus frames

# Virtual Can set-up
modprobe vcan
ip link add dev slcan0 type vcan
ip link set up slcan0

# CANbus frames generation

devices_ids=(5 7 A F 14 19 1E 23 24 25 26 27 28 2D 32 37 3C 3D 41 46 4B 50 55 5A 5F 60 64 69 6E 73 78 7D 82 87 8C 91 96 9B)

foreach d_id devices_ids
    echo ${d_id}
    #cansend slcan0 $d_id#00FFAA5501020304  
end
