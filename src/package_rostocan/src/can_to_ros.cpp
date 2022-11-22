
#include "ros/ros.h"
#include "package_rostocan/apps.h"
#include "CanBridge.h"


int main(int argc, char **argv)
{

  ros::init(argc, argv, "can_to_ros");

  ros::NodeHandle n;

  ros::Publisher apps_pub = n.advertise<package_rostocan::apps>("apps", 1000);

  ros::Rate loop_rate(10);

  int nbytes;
  CanBridge slcan;
  

  while (ros::ok())
  {
    package_rostocan::apps msg;
    
    slcan.init("slcan0");
    struct can_frame frame;
    nbytes = read(slcan.s, &frame, sizeof(struct can_frame));    
    msg.pedal_position = frame.data[0];

    ROS_INFO("%d", msg.pedal_position);

    apps_pub.publish(msg);

    ros::spinOnce();

    loop_rate.sleep();
  }


  return 0;
}