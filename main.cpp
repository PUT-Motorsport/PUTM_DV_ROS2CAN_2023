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

int main(void)
{
	int s;                              // file descriptor to a network socket
	
    int nbytes;                         // number of bytes wrote by function wirte()

	struct sockaddr_can addr;           // structure that holds information about a socket
	struct can_frame frame;             // can frame that is later sent
	struct ifreq ifr;                   // structure that is returned by ioctl()

	const char *ifname = "slcan0";      // network interface name


    
	if ((s = socket(PF_CAN, SOCK_RAW, CAN_RAW)) == -1)          // ceate a socket and return a file descriptor
    { 
		perror("Error while opening socket");
		return -1;
	}
    
	strcpy(ifr.ifr_name, ifname);       // assign interface name to ifr structure

	ioctl(s, SIOCGIFINDEX, &ifr);       // return network index number via ifr structure
	
	addr.can_family  = AF_CAN;          // set the address family type
	addr.can_ifindex = ifr.ifr_ifindex; // pass the network interface index

	printf("%s at index %d\n", ifname, ifr.ifr_ifindex);

	if (bind(s, (struct sockaddr *)&addr, sizeof(addr)) == -1) {
		perror("Error in socket bind");
		return -2;
	}

	frame.can_id  = 0x123;
	frame.can_dlc = 2;
	frame.data[0] = 0x11;
	frame.data[1] = 0x22;

	nbytes = write(s, &frame, sizeof(struct can_frame));

	printf("Wrote %d bytes\n", nbytes);

	return 0;
}