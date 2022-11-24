#include <string.h>

#include "CanBridge.h"

CanBridge::CanBridge(): 
apps_pub{n.advertise<package_rostocan::apps>("apps", 1)}
{

}

int CanBridge::canInit(const char* ifname = "slcan0")
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
		return -1;
	}
	return 0;
}

int CanBridge::canWrite()
{
    return 0;
}

int CanBridge::canRead()
{
	int nbytes;
	struct can_frame frame;
    
	nbytes = read(this->s, &frame, sizeof(struct can_frame));

	
	//this is the time to create a new msg mased on the received id
	switch(frame.can_id)
	{
		case PUTM_CAN::APPS_MAIN_CAN_ID:
			if(PUTM_CAN::APPS_MAIN_CAN_DLC == sizeof(frame.data)) 
			{	
				package_rostocan::apps ros_msg;
				auto can_msg = reinterpret_cast<PUTM_CAN::Apps_main*>(frame.data);
				ros_msg.counter = can_msg->counter;
				ROS_INFO("%d", ros_msg.counter);
				apps_pub.publish(ros_msg);
			}
			break;

		case 0x69:
			if(8 == sizeof(frame.data)) 
			{	
				package_rostocan::apps ros_msg;
				auto can_msg = reinterpret_cast<PUTM_CAN::Apps_main*>(frame.data);
				ros_msg.counter = can_msg->counter;
				ROS_INFO("%d", ros_msg.counter);
				apps_pub.publish(ros_msg);
			}
			break;



	}



	return 0;
}