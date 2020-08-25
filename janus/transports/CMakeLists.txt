
add_library(janus_transports transport.h transport.c)
add_library(janus_websockets SHARED transport.h janus_websockets.c)
add_library(janus_http SHARED transport.h janus_http.c)
