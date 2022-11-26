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
  struct can_frame frame;

  /* TODO
    @ ros_msg to can_msg
    @ can_msg to can_data array
    @ can_data to frame.data[]
    @ frame send
    @ any safety checks???????

  
  */

	// frame.can_id  = PUTM_CAN::APPS_MAIN_CAN_ID;
	// frame.can_dlc = PUTM_CAN::APPS_MAIN_CAN_DLC;
  

	// write(s, &frame, sizeof(struct can_frame));
  
  
  ROS_INFO("I heard: [%d]", ros_msg->counter);
}

void CanTransmitter::callback_WheelTemp_main(const package_rostocan::WheelTemp_main::ConstPtr& ros_msg)
{
  ROS_INFO("I heard: [%d]", ros_msg->wheelTemp0);
}