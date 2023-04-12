#include "../inc/RoomControl.h"

void RoomControl::onStartClassRoom(sio::event& event) {
    std::cout << "onStartClassRoom: " << event.get_message()->get_string() << std::endl;
};

void RoomControl::onEndClassRoom(sio::event& event) {
    std::cout << "onEndClassRoom: " << event.get_message()->get_string() << std::endl;
};

RoomControl::RoomControl(/* args */)
{
}

RoomControl::~RoomControl()
{
}