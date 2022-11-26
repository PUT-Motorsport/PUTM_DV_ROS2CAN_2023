#include "CanBase.h"

class CanTransmitter : public CanBase
{
    public:
        CanTransmitter();

    private:
        ros::Subscriber subscriber_Apps_main;
        void callback_Apps_main(const package_rostocan::Apps_main::ConstPtr& ros_msg);

        ros::Subscriber subscriber_WheelTemp_main;
        void callback_WheelTemp_main(const package_rostocan::WheelTemp_main::ConstPtr& ros_msg);
        
        //subscribers & callbacks:
        // ...
};