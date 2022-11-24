#include "ros/ros.h"

#include "package_rostocan/apps.h"


void appsCallback(const package_rostocan::apps::ConstPtr& msg)
{
  ROS_INFO("I heard: [%d]", msg->counter);
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "ros_to_can");

  ros::NodeHandle n;

  ros::Subscriber sub = n.subscribe("apps", 1000, appsCallback);

  ros::spin();

  return 0;
}
