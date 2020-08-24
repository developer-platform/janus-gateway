workspace(name = "janus_gateway")

load("//bazel:build_system.bzl", "builder_repositories")
builder_repositories()


load("@rules_foreign_cc//:workspace_definitions.bzl", "rules_foreign_cc_dependencies")

rules_foreign_cc_dependencies([
    "//:built_ninja_toolchain_osx",
    "//:built_ninja_toolchain_linux",
])


load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")
bazel_skylib_workspace()

# 添加外部函数依赖
load("//bazel/extern:externel_repository.bzl", "janus_dependency")
#package(default_visibility = ["//visibility:public"])
janus_dependency()