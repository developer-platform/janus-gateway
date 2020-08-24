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
#添加库文件搜索路径
link_directories(
        ${PROJECT_SOURCE_DIR}/build/lib
)

#LOGGER 子目录
set(LOG_FILES "./janus/loggers/logger.h" "../janus/loggers/janus_jsonlog.c")
# transport 子目录
file(GLOB TRANSPORT_FILES "./janus/transports/*.h" "./janus/transports/*.c")
file(GLOB EVENTS_FILES "./events/*.h" "./events/*.c")
file(GLOB_RECURSE  FUZZERS_FILES "./fuzzers/*.h" "./fuzzers/*.c")
file(GLOB_RECURSE  PLUGINS_FILES "./plugins/*.h" "./plugins/*.c")


aux_source_directory(. DIR_SRCS)
add_executable(janus ${DIR_SRCS} ${LOG_FILES} ${TRANSPORT_FILES} ${EVENTS_FILES} ${FUZZERS_FILES} ${PLUGINS_FILES})