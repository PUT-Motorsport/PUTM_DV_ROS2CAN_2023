#include "CanBase.h"

class CanReceiver : public CanBase
{
    public:
        CanReceiver();

        int canReceive();

    private:
        ros::Publisher publisher_Apps_main;
        ros::Publisher publisher_WheelTemp_main;
        // publisher_

        int receive_Apps_main(can_frame& frame);
        int receive_WheelTemp_main(can_frame& frame);
        // receive_
};