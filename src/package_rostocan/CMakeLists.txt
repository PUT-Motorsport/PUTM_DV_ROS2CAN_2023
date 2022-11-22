# %Tag(FULLTEXT)%
cmake_minimum_required(VERSION 2.8.3)
project(package_rostocan)

## Find catkin and any catkin packages
find_package(catkin REQUIRED COMPONENTS
   roscpp
   rospy
   std_msgs
   message_generation
)
## Declare ROS messages and services
add_message_files(FILES apps.msg)

## Generate added messages and services
generate_messages(DEPENDENCIES std_msgs)

## Declare a catkin package
catkin_package(CATKIN_DEPENDS message_runtime)

## Build talker and listener
include_directories(include ${catkin_INCLUDE_DIRS})

add_executable(ros_to_can src/ros_to_can.cpp)
target_link_libraries(ros_to_can ${catkin_LIBRARIES})
add_dependencies(ros_to_can package_rostocan_generate_messages_cpp)

add_executable(can_to_ros src/can_to_ros.cpp src/CanBridge.cpp)
target_link_libraries(can_to_ros ${catkin_LIBRARIES})
add_dependencies(can_to_ros package_rostocan_generate_messages_cpp)

# %EndTag(FULLTEXT)%
