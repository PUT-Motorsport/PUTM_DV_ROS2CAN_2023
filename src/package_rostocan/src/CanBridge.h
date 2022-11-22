#include <net/if.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/ioctl.h>
#include <linux/can.h>

class CanBridge
{
    public:
    CanBridge();
    //~CanBridge();
    int init(const char* ifname = "slcan0");
    int write();
    int read();

    //private:
    int s;

};