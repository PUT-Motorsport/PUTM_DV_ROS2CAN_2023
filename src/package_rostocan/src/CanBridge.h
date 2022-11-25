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


class CanBridge
{
    
    private:
        int s;
        ros::NodeHandle n;
        ros::Publisher publisher_Apps_main;
        ros::Publisher publisher_WheelTemp_main;
    
    public:
        CanBridge();
        int canInit(const char* ifname);
        int canWrite();
        int canRead();

};