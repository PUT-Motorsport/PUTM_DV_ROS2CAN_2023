#include "CanReceiver.h"
#include <algorithm>

CanReceiver::CanReceiver():
publisher_Apps_main{n.advertise<package_rostocan::Apps_main>("received/Apps_main", 1)},
publisher_WheelTemp_main{n.advertise<package_rostocan::WheelTemp_main>("received/WheelTemp_main", 1)}
// ...
{

}

int CanReceiver::canReceive()
{
	int data_size = 0;
	struct can_frame frame;
	read(this->s, &frame, sizeof(struct can_frame)); // Check for errors

	ROS_INFO("New data");
	
	// This is the time where a new msg based on the received id is created
	switch(frame.can_id)
	{
		/* TEMPLATE:
		
		case PUTM_CAN::DEVICE_CAN_ID:	
			if(frame.can_dlc == PUTM_CAN::DEVICE_CAN_DLC)
			{
				package_rostocan::Device ros_msg;
				uint8_t can_data[PUTM_CAN::DEVICE_CAN_DLC];

				std::copy(&frame.data[0], &frame.data[PUTM_CAN::DEVICE_CAN_DLC], can_data);
				auto can_msg = reinterpret_cast<PUTM_CAN::Device*>(can_data);
					
				ros_msg.device_data = can_msg->device_data;
				...
					
				publisher_Device.publish(ros_msg);
			}
			break;
		*/

		case PUTM_CAN::APPS_MAIN_CAN_ID:	

			if(frame.can_dlc == PUTM_CAN::APPS_MAIN_CAN_DLC) // Check if the incomming frame is the same lenght as in the library
			{
				package_rostocan::Apps_main ros_msg;
				uint8_t can_data[PUTM_CAN::APPS_MAIN_CAN_DLC];

				std::copy(&frame.data[0], &frame.data[PUTM_CAN::APPS_MAIN_CAN_DLC], can_data);
				auto can_msg = reinterpret_cast<PUTM_CAN::Apps_main*>(can_data);
					
				ros_msg.counter 		= 	can_msg->counter;
				ros_msg.pedal_position 	= 	can_msg->pedal_position;
				ros_msg.position_diff 	= 	can_msg->position_diff;
				ros_msg.device_state 	= 	static_cast<uint8_t>(can_msg->device_state);
					
				publisher_Apps_main.publish(ros_msg);
			}
			break;

		case PUTM_CAN::WHEELTEMP_MAIN_CAN_ID:	
			if(frame.can_dlc == PUTM_CAN::WHEELTEMP_MAIN_CAN_DLC)
			{
				package_rostocan::WheelTemp_main ros_msg;
				uint8_t can_data[PUTM_CAN::WHEELTEMP_MAIN_CAN_DLC];

				std::copy(&frame.data[0], &frame.data[PUTM_CAN::WHEELTEMP_MAIN_CAN_DLC], can_data);
				auto can_msg = reinterpret_cast<PUTM_CAN::WheelTemp_main*>(can_data);
					
				ros_msg.wheelTemp0 = can_msg->wheelTemp[0];
				ros_msg.wheelTemp1 = can_msg->wheelTemp[1];
				ros_msg.wheelTemp2 = can_msg->wheelTemp[2];
				ros_msg.wheelTemp3 = can_msg->wheelTemp[3];
				ros_msg.wheelTemp4 = can_msg->wheelTemp[4];
				ros_msg.wheelTemp5 = can_msg->wheelTemp[5];
				ros_msg.wheelTemp6 = can_msg->wheelTemp[6];
				ros_msg.wheelTemp7 = can_msg->wheelTemp[7];
					
				publisher_WheelTemp_main.publish(ros_msg);
			}
			break;
	}
	return 0;
}