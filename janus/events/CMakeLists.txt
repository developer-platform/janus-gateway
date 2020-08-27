
add_library(janus_sampleevh SHARED eventhandler.h janus_sampleevh.c)
add_library(janus_wsevh SHARED eventhandler.h janus_wsevh.c)


install(TARGETS janus_sampleevh janus_wsevh
        RUNTIME DESTINATION events
        LIBRARY DESTINATION events
        ARCHIVE DESTINATION events
        )