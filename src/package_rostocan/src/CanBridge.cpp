#include <string.h>

#include "CanBridge.h"

int counter = 0;

CanBridge::CanBridge(): 
publisher_Apps_main{n.advertise<package_rostocan::Apps_main>("Apps_main", 1)},
publisher_WheelTemp_main{n.advertise<package_rostocan::WheelTemp_main>("WheelTemp_main", 1)}
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
	int error;
	int data_size = 0;
	struct can_frame frame;
    
	error = read(this->s, &frame, sizeof(struct can_frame));

	for(; data_size<8; data_size++)
	{
		if(frame.data[data_size]==0) break;
	}

	
	// This is the time to create a new msg based on the received id
	

	switch(frame.can_id)
	{
		case PUTM_CAN::APPS_MAIN_CAN_ID:
			if(PUTM_CAN::APPS_MAIN_CAN_DLC == data_size) 
			{	
				package_rostocan::Apps_main ros_msg;
				auto can_msg = reinterpret_cast<PUTM_CAN::Apps_main*>(frame.data);
				
				ros_msg.counter = can_msg->counter;
				ros_msg.pedal_position = can_msg->pedal_position;
				ros_msg.position_diff = can_msg->position_diff;
				ros_msg.device_state = static_cast<uint8_t>(can_msg->device_state);

				//ROS_INFO("id: %d", PUTM_CAN::APPS_MAIN_CAN_ID);
				ROS_INFO("Apps_main %d", ++counter);//ros_msg.counter);
				publisher_Apps_main.publish(ros_msg);
			}
			break;

		case PUTM_CAN::WHEELTEMP_MAIN_CAN_ID:
			if(PUTM_CAN::WHEELTEMP_MAIN_CAN_DLC == data_size) 
			{	
				package_rostocan::WheelTemp_main ros_msg;
				auto can_msg = reinterpret_cast<PUTM_CAN::WheelTemp_main*>(frame.data);
				ros_msg.temp0 = can_msg->wheelTemp[0];
				ROS_INFO("WheelTemp %d", ros_msg.temp0);
				publisher_WheelTemp_main.publish(ros_msg);
			}
			break;



	}



	return 0;
}