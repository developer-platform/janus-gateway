
#LOGGER 子目录
add_subdirectory(loggers)
add_subdirectory(events)
add_subdirectory(transports)
# transport 子目录
#file(GLOB TRANSPORT_FILES "./transports/*.h" "./transports/*.c")
#file(GLOB EVENTS_FILES "./events/*.h" "./events/*.c")
#file(GLOB_RECURSE  FUZZERS_FILES "./fuzzers/*.h" "./fuzzers/*.c")
#file(GLOB_RECURSE  PLUGINS_FILES "./plugins/*.h" "./plugins/*.c")



aux_source_directory(. DIR_SRCS)
add_executable(janus-gateway ${DIR_SRCS} ${LOG_FILES} ${TRANSPORT_FILES} ${EVENTS_FILES} ${FUZZERS_FILES} ${PLUGINS_FILES})
# 链接自定义共享库
target_link_libraries(janus-gateway jlogger)
target_link_libraries(janus-gateway janus_transports)
target_link_libraries(janus-gateway janus_plugin)
## 简单的rest事件处理器
#target_link_libraries(janus-gateway sampleevh)
## webservice 事件处理器
#target_link_libraries(janus-gateway wsevh)


target_link_libraries(janus-gateway jansson)
target_link_libraries(janus-gateway glib)
target_link_libraries(janus-gateway microhttpd)
target_link_libraries(janus-gateway rabbitmq)
target_link_libraries(janus-gateway srtp2)
target_link_libraries(janus-gateway usrsctp)
target_link_libraries(janus-gateway websockets)
target_link_libraries(janus-gateway sofia-sip-ua)
target_link_libraries(janus-gateway opus)
target_link_libraries(janus-gateway openssl)
target_link_libraries(janus-gateway ogg)
target_link_libraries(janus-gateway curl)
target_link_libraries(janus-gateway -lnice)
target_link_libraries(janus-gateway -lpaho-mqtt3as)
target_link_libraries(janus-gateway -lconf)
target_link_libraries(janus-gateway -lnanomsg)
target_link_libraries(janus-gateway -llua5.3)
