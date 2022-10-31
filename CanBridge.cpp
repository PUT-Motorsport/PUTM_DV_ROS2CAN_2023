#include <string.h>

#include "CanBridge.h"


CanBridge::CanBridge()
{

}

int CanBridge::init(const char* ifname)
{
    struct ifreq ifr;
    struct sockaddr_can addr;
    if ((s = socket(PF_CAN, SOCK_RAW, CAN_RAW)) == -1)
    { 
		return -1;
	}
	strcpy(ifr.ifr_name, ifname);
	ioctl(s, SIOCGIFINDEX, &ifr);
	addr.can_family  = AF_CAN;
	addr.can_ifindex = ifr.ifr_ifindex;
	if (bind(s, (struct sockaddr *)&addr, sizeof(addr)) == -1)
    {
		return -2;
	}
    return 0;
}

int CanBridge::write()
{

    return 0;
}

int CanBridge::read()
{
    return 0;
}