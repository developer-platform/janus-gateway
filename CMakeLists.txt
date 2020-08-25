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
#        ${PROJECT_SOURCE_DIR}/janus
        # usrsctp rabbitmq
        /usr/include
        # nanomsg
        /usr/include/x86_64-linux-gnu
        # curl
        /usr/include/x86_64-linux-gnu/curl
        /usr/include/glib-2.0
        /usr/lib/x86_64-linux-gnu/glib-2.0/include
        /usr/include/stun/usages
        /usr/include/stun
        /usr/include/nice
        /usr/include/srtp2
        /usr/include/nanomsg
        # sip
        /usr/include/sofia-sip-1.12
        # openssl
        /usr/include/openssl
        /usr/include/opus
        #include ogg
        /usr/include/ogg
        /usr/include/lua5.3
        # libconfig microhttpd MQTT
        /usr/local/include
)
#添加库文件搜索路径
link_directories(
        ${PROJECT_SOURCE_DIR}/build/lib
        # libcurl
        /usr/lib/x86_64-linux-gnu
)

#SET(CMAKE_MODULE_PATH ${CMAKE_ROOT}/Modules ${CMAKE_SOURCE_DIR}/cmake/modules)
add_library(jasson STATIC IMPORTED)
set_property(TARGET jasson PROPERTY IMPORTED_LOCATION /usr/lib/x86_64-linux-gnu/libjasson.a)

add_library(glib STATIC IMPORTED)
set_property(TARGET glib PROPERTY IMPORTED_LOCATION /usr/lib/x86_64-linux-gnu/libglib-2.0.a)

add_library(microhttpd STATIC IMPORTED)
set_property(TARGET microhttpd PROPERTY IMPORTED_LOCATION /usr/local/lib/libmicrohttpd.a)

add_library(rabbitmq STATIC IMPORTED)
set_property(TARGET rabbitmq PROPERTY IMPORTED_LOCATION /usr/lib/x86_64-linux-gnu/librabbitmq.a)

add_library(srtp2 STATIC IMPORTED)
set_property(TARGET srtp2 PROPERTY IMPORTED_LOCATION /usr/lib/x86_64-linux-gnu/libsrtp2.a)

add_library(usrsctp STATIC IMPORTED)
set_property(TARGET usrsctp PROPERTY IMPORTED_LOCATION /usr/lib/x86_64-linux-gnu/libusrsctp.a)

add_library(websockets STATIC IMPORTED)
set_property(TARGET websockets PROPERTY IMPORTED_LOCATION /usr/lib/x86_64-linux-gnu/libwebsockets.a)

add_library(sofia-sip-ua STATIC IMPORTED)
set_property(TARGET sofia-sip-ua PROPERTY IMPORTED_LOCATION /usr/lib/libsofia-sip-ua.a)

add_library(opus STATIC IMPORTED)
set_property(TARGET opus PROPERTY IMPORTED_LOCATION /usr/lib/libopus.a)

add_library(openssl STATIC IMPORTED)
set_property(TARGET openssl PROPERTY IMPORTED_LOCATION /usr/lib/libssl.a)

add_library(ogg STATIC IMPORTED)
set_property(TARGET ogg PROPERTY IMPORTED_LOCATION /usr/lib/libogg.a)

add_library(curl STATIC IMPORTED)
set_property(TARGET curl PROPERTY IMPORTED_LOCATION /usr/lib/x86_64-linux-gnu/libcurl.a)

# 使用srtp2
add_definitions(
        -DHAVE_SRTP_2
)

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

