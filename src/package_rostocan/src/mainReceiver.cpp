
#include "ros/ros.h"
#include "CanReceiver.h"


int main(int argc, char **argv)
{
  
  ros::init(argc, argv, "CanReceiver");
  CanReceiver slcanRx;
  slcanRx.canConnect();

  while (ros::ok())
  {
    slcanRx.canReceive();
    ros::spinOnce();
  }
  
  return 0;
}