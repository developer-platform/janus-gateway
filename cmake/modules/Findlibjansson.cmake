MESSAGE(STATUS "using bundled Findlibjansson.cmake...")
FIND_PATH(
        LIBJANSSON_INCLUDE_DIR
        jansson.h
        /usr/include
)
FIND_LIBRARY(
        LIBJANSSON_LIBRARIES NAMES jsonsson
        PATHS /usr/lib/x86_64-linux-gnu/
)