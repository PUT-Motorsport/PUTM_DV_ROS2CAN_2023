#include "CanBase.h"

class CanTransceiver : public CanBase
{
    public:
        CanTransceiver();

    private:
        int callback_Apps_main();
        //subscribers
};