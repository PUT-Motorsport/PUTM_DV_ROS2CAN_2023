#include <net/if.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/ioctl.h>
#include <linux/can.h>
#include <unistd.h>

#include "ros/ros.h"

#include "package_rostocan/Apps_main.h"
#include "package_rostocan/WheelTemp_main.h"

#include "CanHeaders/PM08-CANBUS-APPS.hpp"
#include "CanHeaders/PM08-CANBUS-WHEELTEMP.hpp"


class CanBase
{
    protected:
        int s;
        ros::NodeHandle n;
    public:
        int canConnect(const char* ifname = "slcan0");
};