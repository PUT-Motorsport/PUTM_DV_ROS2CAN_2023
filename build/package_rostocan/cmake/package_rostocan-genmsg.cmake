# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "package_rostocan: 2 messages, 0 services")

set(MSG_I_FLAGS "-Ipackage_rostocan:/home/mateusz/rostocan_workspace/src/package_rostocan/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(package_rostocan_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/mateusz/rostocan_workspace/src/package_rostocan/msg/Apps_main.msg" NAME_WE)
add_custom_target(_package_rostocan_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "package_rostocan" "/home/mateusz/rostocan_workspace/src/package_rostocan/msg/Apps_main.msg" ""
)

get_filename_component(_filename "/home/mateusz/rostocan_workspace/src/package_rostocan/msg/WheelTemp_main.msg" NAME_WE)
add_custom_target(_package_rostocan_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "package_rostocan" "/home/mateusz/rostocan_workspace/src/package_rostocan/msg/WheelTemp_main.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(package_rostocan
  "/home/mateusz/rostocan_workspace/src/package_rostocan/msg/Apps_main.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/package_rostocan
)
_generate_msg_cpp(package_rostocan
  "/home/mateusz/rostocan_workspace/src/package_rostocan/msg/WheelTemp_main.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/package_rostocan
)

### Generating Services

### Generating Module File
_generate_module_cpp(package_rostocan
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/package_rostocan
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(package_rostocan_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(package_rostocan_generate_messages package_rostocan_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mateusz/rostocan_workspace/src/package_rostocan/msg/Apps_main.msg" NAME_WE)
add_dependencies(package_rostocan_generate_messages_cpp _package_rostocan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mateusz/rostocan_workspace/src/package_rostocan/msg/WheelTemp_main.msg" NAME_WE)
add_dependencies(package_rostocan_generate_messages_cpp _package_rostocan_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(package_rostocan_gencpp)
add_dependencies(package_rostocan_gencpp package_rostocan_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS package_rostocan_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(package_rostocan
  "/home/mateusz/rostocan_workspace/src/package_rostocan/msg/Apps_main.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/package_rostocan
)
_generate_msg_eus(package_rostocan
  "/home/mateusz/rostocan_workspace/src/package_rostocan/msg/WheelTemp_main.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/package_rostocan
)

### Generating Services

### Generating Module File
_generate_module_eus(package_rostocan
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/package_rostocan
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(package_rostocan_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(package_rostocan_generate_messages package_rostocan_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mateusz/rostocan_workspace/src/package_rostocan/msg/Apps_main.msg" NAME_WE)
add_dependencies(package_rostocan_generate_messages_eus _package_rostocan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mateusz/rostocan_workspace/src/package_rostocan/msg/WheelTemp_main.msg" NAME_WE)
add_dependencies(package_rostocan_generate_messages_eus _package_rostocan_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(package_rostocan_geneus)
add_dependencies(package_rostocan_geneus package_rostocan_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS package_rostocan_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(package_rostocan
  "/home/mateusz/rostocan_workspace/src/package_rostocan/msg/Apps_main.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/package_rostocan
)
_generate_msg_lisp(package_rostocan
  "/home/mateusz/rostocan_workspace/src/package_rostocan/msg/WheelTemp_main.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/package_rostocan
)

### Generating Services

### Generating Module File
_generate_module_lisp(package_rostocan
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/package_rostocan
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(package_rostocan_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(package_rostocan_generate_messages package_rostocan_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mateusz/rostocan_workspace/src/package_rostocan/msg/Apps_main.msg" NAME_WE)
add_dependencies(package_rostocan_generate_messages_lisp _package_rostocan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mateusz/rostocan_workspace/src/package_rostocan/msg/WheelTemp_main.msg" NAME_WE)
add_dependencies(package_rostocan_generate_messages_lisp _package_rostocan_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(package_rostocan_genlisp)
add_dependencies(package_rostocan_genlisp package_rostocan_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS package_rostocan_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(package_rostocan
  "/home/mateusz/rostocan_workspace/src/package_rostocan/msg/Apps_main.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/package_rostocan
)
_generate_msg_nodejs(package_rostocan
  "/home/mateusz/rostocan_workspace/src/package_rostocan/msg/WheelTemp_main.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/package_rostocan
)

### Generating Services

### Generating Module File
_generate_module_nodejs(package_rostocan
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/package_rostocan
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(package_rostocan_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(package_rostocan_generate_messages package_rostocan_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mateusz/rostocan_workspace/src/package_rostocan/msg/Apps_main.msg" NAME_WE)
add_dependencies(package_rostocan_generate_messages_nodejs _package_rostocan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mateusz/rostocan_workspace/src/package_rostocan/msg/WheelTemp_main.msg" NAME_WE)
add_dependencies(package_rostocan_generate_messages_nodejs _package_rostocan_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(package_rostocan_gennodejs)
add_dependencies(package_rostocan_gennodejs package_rostocan_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS package_rostocan_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(package_rostocan
  "/home/mateusz/rostocan_workspace/src/package_rostocan/msg/Apps_main.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/package_rostocan
)
_generate_msg_py(package_rostocan
  "/home/mateusz/rostocan_workspace/src/package_rostocan/msg/WheelTemp_main.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/package_rostocan
)

### Generating Services

### Generating Module File
_generate_module_py(package_rostocan
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/package_rostocan
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(package_rostocan_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(package_rostocan_generate_messages package_rostocan_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mateusz/rostocan_workspace/src/package_rostocan/msg/Apps_main.msg" NAME_WE)
add_dependencies(package_rostocan_generate_messages_py _package_rostocan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mateusz/rostocan_workspace/src/package_rostocan/msg/WheelTemp_main.msg" NAME_WE)
add_dependencies(package_rostocan_generate_messages_py _package_rostocan_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(package_rostocan_genpy)
add_dependencies(package_rostocan_genpy package_rostocan_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS package_rostocan_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/package_rostocan)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/package_rostocan
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(package_rostocan_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/package_rostocan)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/package_rostocan
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(package_rostocan_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/package_rostocan)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/package_rostocan
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(package_rostocan_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/package_rostocan)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/package_rostocan
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(package_rostocan_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/package_rostocan)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/package_rostocan\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/package_rostocan
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(package_rostocan_generate_messages_py std_msgs_generate_messages_py)
endif()
