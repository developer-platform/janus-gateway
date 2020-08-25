cmake_minimum_required(VERSION 2.6)
project(janus-gateway LANGUAGES C)

set(CMAKE_C_STANDARD 99)
#CMAKE_C_COMPILER(clang)
set(CMAKE_BUILD_TYPE "Debug")
#设置库文件存放路径
#设置安装目录
set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR}/install)
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/build/lib)
#设置执行文件存放路径
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/build/bin)

include_directories(
        /usr/include
        /usr/include/x86_64-linux-gnu
        /usr/include/glib-2.0
        /usr/lib/x86_64-linux-gnu/glib-2.0/include
)
#添加库文件搜索路径
link_directories(
        ${PROJECT_SOURCE_DIR}/build/lib
)

#SET(CMAKE_MODULE_PATH ${CMAKE_ROOT}/Modules ${CMAKE_SOURCE_DIR}/cmake/modules)
add_library(jasson STATIC IMPORTED)
set_property(TARGET jasson PROPERTY IMPORTED_LOCATION /usr/lib/x86_64-linux-gnu/libjasson.a)

add_library(glib STATIC IMPORTED)
set_property(TARGET glib PROPERTY IMPORTED_LOCATION /usr/lib/x86_64-linux-gnu/libglib-2.0.a)

add_subdirectory(janus)


# 添加json库
#FIND_PACKAGE(libjansson REQUIRED)
#MARK_AS_ADVANCED(
#        LIBJANSSON_INCLUDE_DIR
#        LIBJANSSON_LIBRARIES
#)
#IF (LIBJANSSON_INCLUDE_DIR AND LIBJANSSON_LIBRARIES)
#    MESSAGE(STATUS "Found libjansson libraries")
#    INCLUDE_DIRECTORIES(${LIBJANSSON_INCLUDE_DIR})
#    MESSAGE(${LIBJANSSON_LIBRARIES})
#    TARGET_LINK_LIBRARIES(janus-gateway ${LIBJANSSON_LIBRARIES})
#ENDIF (LIBJANSSON_INCLUDE_DIR AND LIBJANSSON_LIBRARIES)

