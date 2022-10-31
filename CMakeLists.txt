cmake_minimum_required(VERSION 3.0.0)
project(ROS2CAN VERSION 0.1.0)

include(CTest)
enable_testing()

add_executable(ROS2CAN main.cpp CanBridge.cpp) 
target_compile_features(ROS2CAN PRIVATE cxx_std_17)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
