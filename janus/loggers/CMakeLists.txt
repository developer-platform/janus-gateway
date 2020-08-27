aux_source_directory(. LOGGER_SRCS)
add_library(janus_jsonlog SHARED ${LOGGER_SRCS})
install(TARGETS janus_jsonlog
        RUNTIME DESTINATION loggers
        LIBRARY DESTINATION loggers
        ARCHIVE DESTINATION loggers
        )