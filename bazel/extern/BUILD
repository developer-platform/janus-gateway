load("@rules_foreign_cc//tools/build_defs:cmake.bzl", "cmake_external")

package(default_visibility = ["//visibility:public"])


cmake_external(
   name = "jansson",
   # Values to be passed as -Dkey=value on the CMake command line;
   # here are serving to provide some CMake script configuration options
   cache_entries = {
       "JANSSON_EXAMPLES": "off",
       #"BUILD_WITHOUT_LAPACK": "no",
   },
   lib_source = "@jansson//:all",

   # We are selecting the resulting static library to be passed in C/C++ provider
   # as the result of the build;
   # However, the cmake_external dependants could use other artefacts provided by the build,
   # according to their CMake script
   static_libraries = ["libjansson.a"],
)

cmake_external(
   name = "srtp2",
   # Values to be passed as -Dkey=value on the CMake command line;
   # here are serving to provide some CMake script configuration options

   lib_source = "@libsrtp//:all",

   # We are selecting the resulting static library to be passed in C/C++ provider
   # as the result of the build;
   # However, the cmake_external dependants could use other artefacts provided by the build,
   # according to their CMake script
   static_libraries = ["srtp2.a"],
)




cc_binary(
    name = "cmake_example",
    srcs = ["hello.c"],
    deps = [
        ":libconfig",
        ":jansson"
    ]
)