
add_library(sampleevh SHARED eventhandler.h janus_sampleevh.c)
add_library(wsevh SHARED eventhandler.h janus_wsevh.c)

install(TARGETS sampleevh
        EXPORT sampleevh
        LIBRARY DESTINATION events
        )