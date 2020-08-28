
#LOGGER 子目录
add_subdirectory(loggers)
add_subdirectory(events)
add_subdirectory(transports)
add_subdirectory(plugins)
# transport 子目录
#file(GLOB TRANSPORT_FILES "./transports/*.h" "./transports/*.c")
#file(GLOB EVENTS_FILES "./events/*.h" "./events/*.c")
#file(GLOB_RECURSE  FUZZERS_FILES "./fuzzers/*.h" "./fuzzers/*.c")
#file(GLOB_RECURSE  PLUGINS_FILES "./plugins/*.h" "./plugins/*.c")

file(GLOB janus_source
        apierror.c apierror.h auth.c auth.h
        cmdline.c cmdline.h
        config.c config.h
        debug.h
        dtls.c dtls.h dtls-bio.c dtls-bio.h
        events.c events.h
        ice.c ice.h
        janus.c janus.h
        log.c log.h
        mutex.h
        record.c record.h refcount.h
        rtcp.c rtcp.h rtp.c rtp.h rtpsrtp.h sctp.c sctp.h
        sdp.c sdp.h sdp-utils.c sdp-utils.h
        ip-utils.c ip-utils.h
        turnrest.c turnrest.h
        utils.c utils.h
        version.c version.h
        text2pcap.c text2pcap.h
        plugins/plugin.c plugins/plugin.h
        transports/transport.h transports/transport.c
        events/eventhandler.h
        loggers/logger.h )

add_executable(janus-gateway ${janus_source})


target_link_libraries(janus-gateway -ljansson)
target_link_libraries(janus-gateway -lconfig)
#target_link_libraries(janus-gateway -lrabbitmq)
target_link_libraries(janus-gateway -lsrtp2)
target_link_libraries(janus-gateway -lusrsctp)
#target_link_libraries(janus-gateway -lsofia-sip-ua)
target_link_libraries(janus-gateway -lopus)
#target_link_libraries(janus-gateway openssl)
target_link_libraries(janus-gateway -lnice)
target_link_libraries(janus-gateway -lpaho-mqtt3as)
target_link_libraries(janus-gateway -lnanomsg)
target_link_libraries(janus-gateway -llua5.3)
target_link_libraries(janus-gateway -lgio-2.0)
target_link_libraries(janus-gateway -lglib-2.0)
target_link_libraries(janus-gateway -lgobject-2.0)
target_link_libraries(janus-gateway -lpthread)
target_link_libraries(janus-gateway -lssl)
target_link_libraries(janus-gateway -lcrypto)
target_link_libraries(janus-gateway -lm)
target_link_libraries(janus-gateway -ldl)
target_link_libraries(janus-gateway -lz)
target_link_libraries(janus-gateway -lidn2)
target_link_libraries(janus-gateway -lcurl)
target_link_libraries(janus-gateway -logg)
target_link_libraries(janus-gateway -lwebsockets)
target_link_libraries(janus-gateway -lmicrohttpd)
install(TARGETS janus-gateway
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION bin
        ARCHIVE DESTINATION bin
        )

file(GLOB janus_source janus-cfgconv.c config.c log.c utils.c version.c)