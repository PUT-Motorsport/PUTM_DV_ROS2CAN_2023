#include <net/if.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/ioctl.h>
#include <linux/can.h>
#include <unistd.h>
#include "ros/ros.h"
#include "package_rostocan/apps.h"



class CanBridge
{
    public:
    CanBridge();
    //~CanBridge();
    int canInit(const char* ifname);
    int canWrite();
    int canRead();

    //private:
    int s;
    ros::NodeHandle n;

    ros::Publisher apps_pub;
};

enum CAN_ID : uint16_t 
{
    APPS_MAIN_CAN_ID = 0x5,
    TTS_MAIN_CAN_ID = 0X69
};