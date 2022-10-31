#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#include <net/if.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/ioctl.h>

#include <linux/can.h>
#include <linux/can/raw.h>

#include "CanBridge.h"

int main(void)
{
    struct can_frame frame;             // can frame that is later sent
    int nbytes;                         // number of bytes wrote by function wirte()
	frame.can_id  = 0x123;
	frame.can_dlc = 2;
	frame.data[0] = 0x11;
	frame.data[1] = 0x22;

	CanBridge slcan;
	slcan.init("vcan0");

	nbytes = write(slcan.s, &frame, sizeof(struct can_frame));
    printf("Wrote %d bytes\n", nbytes);
    
    struct can_frame frame2;
    nbytes = read(slcan.s, &frame2, sizeof(struct can_frame));
	for(int i=0; i<8; i++)
	{
		printf("Read %d data\n", frame2.data[i]);
	}
    
	

	return 0;
}