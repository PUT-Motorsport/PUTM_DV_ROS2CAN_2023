# %Tag(FULLTEXT)%
cmake_minimum_required(VERSION 3.12)
project(package_rostocan)

## Find catkin and any catkin packages
find_package(catkin REQUIRED COMPONENTS
   roscpp
   rospy
   std_msgs
   message_generation
)

## Find all message files in the msg directory
file(GLOB msg_files CONFIGURE_DEPENDS "msg/*.msg")
foreach(msg_file ${msg_files})
   get_filename_component(msg_file_nameonly ${msg_file} NAME)
   list(APPEND msg_files_namesonly ${msg_file_nameonly})
endforeach()

## Declare ROS messages and services
add_message_files(FILES ${msg_files_namesonly})

## Generate added messages and services
generate_messages(DEPENDENCIES std_msgs)

## Declare a catkin package
catkin_package(CATKIN_DEPENDS message_runtime)

## Build talker and listener
include_directories(include ${catkin_INCLUDE_DIRS})

add_executable(mainReceiver src/mainReceiver.cpp src/CanReceiver.cpp src/CanBase.cpp)
target_link_libraries(mainReceiver ${catkin_LIBRARIES})
add_dependencies(mainReceiver package_rostocan_generate_messages_cpp)

add_executable(mainTransmitter src/mainTransmitter.cpp src/CanTransmitter.cpp src/CanBase.cpp)
target_link_libraries(mainTransmitter ${catkin_LIBRARIES})
add_dependencies(mainTransmitter package_rostocan_generate_messages_cpp)


# %EndTag(FULLTEXT)%
