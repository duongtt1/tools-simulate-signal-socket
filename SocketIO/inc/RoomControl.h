#include "sio_client.h"
#include <iostream>
#include <mutex>

class RoomControl
{
private:
    RoomControl();
    RoomControl(const RoomControl&) = delete;               // Delete copy constructor
    RoomControl& operator=(const RoomControl&) = delete;    // Delete assignment operator

public:
    static RoomControl& getInstance()
    {
        static std::mutex mtx;                  // Mutex for thread-safety
        std::unique_lock<std::mutex> lock(mtx); // Acquire lock
        static RoomControl instance;            // Static instance of RoomControl
        return instance;
    }

    virtual void onStartClassRoom(sio::event& event);
    virtual void onEndClassRoom(sio::event& event);

    ~RoomControl();
};