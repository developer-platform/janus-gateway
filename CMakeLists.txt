cmake_minimum_required(VERSION 3.2)
project(janus-gateway LANGUAGES C)

set(CMAKE_C_STANDARD 99)
#CMAKE_C_COMPILER(clang)
set(CMAKE_BUILD_TYPE "Debug")
#设置库文件存放路径
#设置安装目录
set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR}/target)
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/build/lib)
#设置执行文件存放路径
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/build/bin)
set(TARGET_DIR ${PROJECT_SOURCE_DIR}/target)

set(EXTERN_LIB_PATH ${PROJECT_SOURCE_DIR}/cmake/3rdparty/lib/linux)

include_directories(
        ${PROJECT_SOURCE_DIR}/janus
        # usrsctp rabbitmq websockets microhttpd sofia-sip-ua
        # /usr/lib
        /usr/include
        # nanomsg curl
        /usr/include/x86_64-linux-gnu
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
        # libcurl ogg ssl libjansson config librabbitmq srtp2
        /usr/lib/x86_64-linux-gnu
        # usrsctp sofia-sip-ua opus
        # /usr/lib
)

function(add_static_lib lname)
    add_library(${lname} STATIC IMPORTED)
    set_property(TARGET ${lname} PROPERTY IMPORTED_LOCATION ${EXTERN_LIB_PATH}/lib${lname}.a)
    endfunction()

#SET(CMAKE_MODULE_PATH ${CMAKE_ROOT}/Modules ${CMAKE_SOURCE_DIR}/cmake/modules)
add_static_lib(jansson)
add_static_lib(config)
add_static_lib(rabbitmq)
add_static_lib(srtp2)
add_static_lib(usrsctp)
add_static_lib(sofia-sip-ua)
add_static_lib(websockets)
add_static_lib(ssl)
add_static_lib(ogg)
add_static_lib(curl)
add_static_lib(microhttpd)

# nice 四大依赖
add_static_lib(nice-random)
add_static_lib(stun)
add_static_lib(socket)
add_static_lib(agent)

add_library(glib STATIC IMPORTED)
set_property(TARGET glib PROPERTY IMPORTED_LOCATION ${EXTERN_LIB_PATH}/libglib-2.0.a)
add_library(gio STATIC IMPORTED)
set_property(TARGET gio PROPERTY IMPORTED_LOCATION ${EXTERN_LIB_PATH}/libgio-2.0.a)
add_library(gobject STATIC IMPORTED)
set_property(TARGET gobject PROPERTY IMPORTED_LOCATION ${EXTERN_LIB_PATH}/libgobject-2.0.a)

set(CMAKE_C_FLAGS -Wl,--copy-dt-needed-entries)
# 使用srtp2
set(AM_CFLAGS -DHAVE_PORTRANGE -DHAVE_LIBOGG -D_GNU_SOURCE)
# use websockct  -DHAVE_WSEVH; use rest handler HAVE_SAMPLEEVH ; 设置ssl超市 -DHAVE_DTLS_SETTIMEOUT -DUSE_PTHREAD_MUTEX
set(JANUS_CFLAGS   -DHAVE_WEBSOCKETS -DHAVE_WSEVH -DHAVE_SAMPLEEVH)
set(LIBSRTP_CFLAGS -DHAVE_SRTP_2 -DHAVE_SCTP)
set(LIBCURL_CFLAGS -DHAVE_LIBCURL -DHAVE_TURNRESTAPI -DHAVE_SAMPLEEVH)
add_definitions(
        -DLOGGERDIR="${TARGET_DIR}/loggers"
        -DCONFDIR="${TARGET_DIR}/etc/janus"
        -DPLUGINDIR="${TARGET_DIR}/plugins"
        -DTRANSPORTDIR="${TARGET_DIR}/transports"
        -DEVENTDIR="${TARGET_DIR}/events"
        ${AM_CFLAGS}
        ${JANUS_CFLAGS}
        ${LIBSRTP_CFLAGS}
        ${LIBCURL_CFLAGS}
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

