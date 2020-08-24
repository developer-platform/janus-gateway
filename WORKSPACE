workspace(name = "janus-gateway")

load("//bazel:build_system.bzl", "builder_repositories")
builder_repositories()
load("//bazel:api_binding.bzl", "api_binding")
api_binding()

load("//bazel:repositories.bzl",
    "dependency_repositories",
    "test_respositories")
dependency_repositories()

load("//bazel:api_build.bzl", "init_api")
init_api()
# load("@rules_foreign_cc//:workspace_definitions.bzl", "rules_foreign_cc_dependencies")
# rules_foreign_cc_dependencies([
#    # "//:built_ninja_toolchain_osx",
#    "//:built_ninja_toolchain_linux",
#    "//:built_cmake_toolchain",
# ])

#load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")
#bazel_skylib_workspace()

test_respositories()

