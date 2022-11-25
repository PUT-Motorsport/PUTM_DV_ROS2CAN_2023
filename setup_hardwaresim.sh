#!/bin/bash

# This script allows to test the ros-can bridge by 
# simulating the USB-CAN device and PM08 CANbus frames

# Virtual Can set-up
modprobe vcan
ip link add dev slcan0 type vcan
ip link set up slcan0





# TASKI
# * pole states dla każdego urządzenia ma być równe 1
# * kazdy typ danych poza states ma zmieniać się w przedziale 1-10 (zarówno int16 jak i int8)
# * devices_ids ma byc pobierane z excela (trzeba pamietac o dodaniu "0" tak by id mialo długość trzy)

# CANbus frames generation
devices_ids=(005 007 00A 00F 014 019 01E 023 024 025 026 027 028 02D 032 037 03C 03D 041 046 04B 050 055 05A 05F 060 064 069 06E 073 078 07D 082 087 08C 091 096 09B)
while true
do
    for d_id in "${devices_ids[@]}"
    do  
        if [ "$d_id" == "001" ]; then # Tutaj zamiast if zrob bashowego switch case'a (chyba ze wymyslisz cos lepszego)
            
            data = "#1009AA5501" # Tutaj losowa ramka zgodna z urzadzeniem

            # Te dwa ponizej chce zeby zostaly
            echo "${d_id}${data}"
            cansend slcan0 "${d_id}${data}"
        fi
        
        # a to na teraz do testow w ostatecznej wersji to usun
        cansend slcan0 "${d_id}#10"
        cansend slcan0 "${d_id}#1009"
        cansend slcan0 "${d_id}#1009AA"
        cansend slcan0 "${d_id}#1009AA55"
        cansend slcan0 "${d_id}#1009AA5512"
        cansend slcan0 "${d_id}#1009AA551253"
        cansend slcan0 "${d_id}#1009AA55125343"
        cansend slcan0 "${d_id}#1009AA5512531216"
        echo "${d_id}: data sent"
    
    done
done
