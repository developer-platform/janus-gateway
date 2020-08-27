
#add_library(janus_transports transport.h transport.c)
add_library(janus_websockets SHARED  janus_websockets.c)
add_library(janus_http SHARED  janus_http.c)

install(TARGETS janus_websockets janus_http
        RUNTIME DESTINATION transports
        LIBRARY DESTINATION transports
        ARCHIVE DESTINATION transports
        )