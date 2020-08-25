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

    http_archive(
        name = "libsrtp",
        build_file_content = BUILD_ALL_CONTENT,
        urls = ["https://github.com/cisco/libsrtp/archive/v2.3.0.zip"],
        sha256 = "55da00b86e03e70935309fdd83697155b2d732a018a1b39c54fb20725c8f6ea1",
        strip_prefix = "libsrtp-2.3.0",
    )
    http_archive(
        name = "usrsctp",
        build_file_content = BUILD_ALL_CONTENT,
        urls = ["https://github.com/sctplab/usrsctp/archive/31f4eb54578c5766cca51191a7aedb834989b0df.zip"],
        #sha256 = "55da00b86e03e70935309fdd83697155b2d732a018a1b39c54fb20725c8f6ea1",
        strip_prefix = "usrsctp-31f4eb54578c5766cca51191a7aedb834989b0df",
    )
    http_archive(
        name = "libmicrohttpd",
        build_file_content = BUILD_ALL_CONTENT,
        urls = ["https://ftp.gnu.org/gnu/libmicrohttpd/libmicrohttpd-0.9.71.tar.gz"],
        #sha256 = "55da00b86e03e70935309fdd83697155b2d732a018a1b39c54fb20725c8f6ea1",
        strip_prefix = "libmicrohttpd-0.9.71",
    )


