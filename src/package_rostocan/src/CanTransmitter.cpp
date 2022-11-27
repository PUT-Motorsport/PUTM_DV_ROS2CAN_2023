#include "CanTransmitter.h"


CanTransmitter::CanTransmitter():
subscriber_Apps_main{n.subscribe("transmitted/Apps_main", 1, &CanTransmitter::callback_Apps_main, this)},
subscriber_WheelTemp_main{n.subscribe("transmitted/WheelTemp_main", 1, &CanTransmitter::callback_WheelTemp_main, this)}
//subscribers & callbacks:
// ...
{
}

void CanTransmitter::callback_Apps_main(const package_rostocan::Apps_main::ConstPtr& ros_msg)
{
  PUTM_CAN::Apps_main can_msg;
  struct can_frame frame;

  can_msg.counter = ros_msg->counter;
  can_msg.pedal_position = ros_msg->pedal_position;
  can_msg.position_diff = ros_msg->position_diff;
  can_msg.device_state = static_cast<PUTM_CAN::Apps_states>(ros_msg->device_state);


	auto can_data = reinterpret_cast<uint8_t*>(&can_msg);


  frame.can_id  = PUTM_CAN::APPS_MAIN_CAN_ID;
	frame.can_dlc = PUTM_CAN::APPS_MAIN_CAN_DLC;

  std::copy(&can_data[0], &can_data[PUTM_CAN::APPS_MAIN_CAN_DLC], frame.data);

	write(s, &frame, sizeof(struct can_frame));
}

void CanTransmitter::callback_WheelTemp_main(const package_rostocan::WheelTemp_main::ConstPtr& ros_msg)
{
  //ROS_INFO("I heard: [%d]", ros_msg->wheelTemp0);
}