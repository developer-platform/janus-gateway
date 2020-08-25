
add_library(janus_plugin transport.h transport.c)
add_library(plugin_audiobridge SHARED janus_audiobridge.c)
add_library(plugin_textroom SHARED janus_textroom.c)
add_library(plugin_videocall SHARED janus_videocall.c)
add_library(plugin_videoroom SHARED janus_videoroom.c)
add_library(plugin_streaming SHARED janus_streaming.c)
add_library(plugin_nosip SHARED janus_nosip.c)
add_library(plugin_recordplay SHARED janus_recordplay.c)


file(GLOB lua_SOURCES plugins/janus_lua.c plugins/janus_lua_data.h plugins/janus_lua_extra.c plugins/janus_lua_extra.h)