#include "ros/ros.h"

#include "package_rostocan/Apps_main.h"
#include "package_rostocan/WheelTemp_main.h"


void appsCallback(const package_rostocan::WheelTemp_main::ConstPtr& msg)
{
  ROS_INFO("I heard: [%d]", msg->wheelTemp0);
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "ros_to_can");

  ros::NodeHandle n;

  ros::Subscriber subscriber_device = n.subscribe("WheelTemp_main", 1, appsCallback);

  ros::spin();

  return 0;
}
