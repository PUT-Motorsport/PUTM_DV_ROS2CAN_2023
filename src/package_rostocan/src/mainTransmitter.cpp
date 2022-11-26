#include "ros/ros.h"

#include "CanTransmitter.h"

int main(int argc, char **argv)
{
  ros::init(argc, argv, "CanTransmitter");
  CanTransmitter slcanTx;
  slcanTx.canConnect("slcan0");
  ros::spin();
  return 0;
}
