
#add_library(janus_plugin transport.h transport.c)
add_library(janus_audiobridge SHARED janus_audiobridge.c)
add_library(janus_textroom SHARED janus_textroom.c)
add_library(janus_videocall SHARED janus_videocall.c)
add_library(janus_videoroom SHARED janus_videoroom.c)
add_library(janus_streaming SHARED janus_streaming.c)
add_library(janus_nosip SHARED janus_nosip.c)
add_library(janus_recordplay SHARED janus_recordplay.c)

install(TARGETS janus_audiobridge janus_textroom janus_videocall janus_videoroom janus_streaming janus_nosip janus_recordplay
        RUNTIME DESTINATION plugins
        LIBRARY DESTINATION plugins
        ARCHIVE DESTINATION plugins
        )
file(GLOB lua_SOURCES janus_lua.c janus_lua_data.h janus_lua_extra.c janus_lua_extra.h)