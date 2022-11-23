
#include "ros/ros.h"
#include "package_rostocan/apps.h"
#include "CanBridge.h"


int main(int argc, char **argv)
{
  
  ros::init(argc, argv, "CanBridge");
  CanBridge slcan;
  slcan.canInit("slcan0");

  while (ros::ok())
  {
    slcan.canRead();
    ros::spinOnce();
  }
  
  return 0;
}