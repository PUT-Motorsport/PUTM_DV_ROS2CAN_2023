#include "CanBase.h"

class CanReceiver : public CanBase
{
    public:
        CanReceiver();
        int canReceive();

    private:
        ros::Publisher publisher_Apps_main;
        ros::Publisher publisher_WheelTemp_main;
};