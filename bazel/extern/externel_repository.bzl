load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository", "new_git_repository")

BUILD_ALL_CONTENT = """filegroup(name = "all", srcs = glob(["**"]), visibility = ["//visibility:public"])"""


# 外部工具链，如cmake
def foreign_cc_():
    git_repository(
        name = "bazel_skylib",
        remote = "https://github.com/bazelbuild/bazel-skylib.git",
        tag = "1.0.2",
    )

    http_archive(
        name = "rules_foreign_cc",
        sha256 = "3184c244b32e65637a74213fc448964b687390eeeca42a36286f874c046bba15",
        strip_prefix = "rules_foreign_cc-7bc4be735b0560289f6b86ab6136ee25d20b65b7",
        build_file_content = BUILD_ALL_CONTENT,
        # 2019-09-26
        urls = ["https://github.com/bazelbuild/rules_foreign_cc/archive/7bc4be735b0560289f6b86ab6136ee25d20b65b7.tar.gz"],
    )

def janus_dependency():
    http_archive(
        name = "jansson",
        urls = ["https://github.com/akheron/jansson/archive/v2.13.1.tar.gz"],
        sha256 = "f22901582138e3203959c9257cf83eba9929ac41d7be4a42557213a22ebcc7a0",
        strip_prefix = "jansson-2.13.1",
        build_file_content = BUILD_ALL_CONTENT
    )

    http_archive(
        name = "libconfig",
        build_file_content = BUILD_ALL_CONTENT,
        urls = ["https://github.com/hyperrealm/libconfig/archive/v1.7.2.tar.gz"],
        sha256 = "f67ac44099916ae260a6c9e290a90809e7d782d96cdd462cac656ebc5b685726",
        strip_prefix = "libconfig-1.7.2",
    )


