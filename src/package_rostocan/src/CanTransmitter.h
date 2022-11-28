#include "CanBase.h"

class CanTransmitter : public CanBase
{

    public:
        CanTransmitter();


    private:
        ros::Subscriber subscriber_Apps_main;
        ros::Subscriber subscriber_WheelTemp_main;
        // subscribers

        void transmit_Apps_main(const package_rostocan::Apps_main::ConstPtr& ros_msg);
        void transmit_WheelTemp_main(const package_rostocan::WheelTemp_main::ConstPtr& ros_msg);
        // transmit_
};