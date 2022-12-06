#include "CanReceiver.h"
#include <algorithm>

CanReceiver::CanReceiver() : 
publisher_Apps_main{n.advertise<package_rostocan::Apps_main>("received/Apps_main", 1)},
publisher_WheelTemp_main{n.advertise<package_rostocan::WheelTemp_main>("received/WheelTemp_main", 1)}
// publisher_
{ }

int CanReceiver::canReceive()
{
	int status = 1;
	int data_size = 0;
	can_frame frame;
	read(this->s, &frame, sizeof(struct can_frame)); // Check for errors
	ROS_INFO("New data");

	switch (frame.can_id)
	{
	case PUTM_CAN::APPS_MAIN_CAN_ID: 		status = receive_Apps_main(frame); 			break;
	case PUTM_CAN::WHEELTEMP_MAIN_CAN_ID: 	status = receive_WheelTemp_main(frame); 	break;
	//case PUTM_CAN::DEVICE_CAN_ID: 		status = receive_Device_main(frame); 		break;
	}
	return status;
}

int CanReceiver::receive_Apps_main(can_frame &frame)
{
	if (frame.can_dlc == PUTM_CAN::APPS_MAIN_CAN_DLC)
	{
		package_rostocan::Apps_main ros_msg;

		auto can_msg = reinterpret_cast<PUTM_CAN::Apps_main *>(frame.data);

		ros_msg.counter = can_msg->counter;
		ros_msg.pedal_position = can_msg->pedal_position;
		ros_msg.position_diff = can_msg->position_diff;
		ros_msg.device_state = static_cast<uint8_t>(can_msg->device_state);

		publisher_Apps_main.publish(ros_msg);
	}
	return 0;
}

int CanReceiver::receive_WheelTemp_main(can_frame &frame)
{
	if (frame.can_dlc == PUTM_CAN::WHEELTEMP_MAIN_CAN_DLC)
	{
		package_rostocan::WheelTemp_main ros_msg;

		auto can_msg = reinterpret_cast<PUTM_CAN::WheelTemp_main *>(frame.data);

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
	return 0;
}

// receive_