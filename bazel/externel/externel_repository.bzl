load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository", "new_git_repository")

BUILD_ALL_CONTENT = """filegroup(name = "all", srcs = glob(["**"]), visibility = ["//visibility:public"])"""

def com_google_absl():
    http_archive(
        name = "com_google_absl",
        urls = ["https://github.com/abseil/abseil-cpp/archive/98eb410c93ad059f9bba1bf43f5bb916fc92a5ea.zip"],
        sha256 = "aabf6c57e3834f8dc3873a927f37eaf69975d4b28117fc7427dfb1c661542a87",
        strip_prefix = "abseil-cpp-98eb410c93ad059f9bba1bf43f5bb916fc92a5ea",
    )
    
def rapidjson():
    http_archive(
        name = "rapidjson",
        sha256 = "a2faafbc402394df0fa94602df4b5e4befd734aad6bb55dfef46f62fcaf1090b",
        strip_prefix = "rapidjson-dfbe1db9da455552f7a9ad5d2aea17dd9d832ac1",
        # Changes through 2019-12-02
        urls = ["https://github.com/Tencent/rapidjson/archive/dfbe1db9da455552f7a9ad5d2aea17dd9d832ac1.tar.gz"],
        # use_category = ["dataplane"],
        # cpe = "cpe:2.3:a:tencent:rapidjson:*",
        build_file = "@//bazel/externel:rpid_json.BUILD",
    )

def com_github_glog():
    http_archive(
        name = "com_github_gflags_gflags",
        strip_prefix = "gflags-2.2.2",
        urls = [
            "https://mirror.bazel.build/github.com/gflags/gflags/archive/v2.2.2.tar.gz",
            "https://github.com/gflags/gflags/archive/v2.2.2.tar.gz",
        ],
    )
    git_repository(
        name = "com_github_glog",
        remote = "https://github.com/google/glog.git",
        init_submodules = True,
        tag = "v0.4.0",
    )

# 外部工具链，如cmake
def foreign_cc_():
    http_archive(
        name = "rules_foreign_cc",
        sha256 = "3184c244b32e65637a74213fc448964b687390eeeca42a36286f874c046bba15",
        strip_prefix = "rules_foreign_cc-7bc4be735b0560289f6b86ab6136ee25d20b65b7",
        # 2019-09-26
        urls = ["https://github.com/bazelbuild/rules_foreign_cc/archive/7bc4be735b0560289f6b86ab6136ee25d20b65b7.tar.gz"],
    )

def google_test():
    git_repository(
        name = "com_google_googletest",
        remote = "https://github.com/google/googletest.git",
        tag = "release-1.10.0",
    )
def com_github_nelhage_rules_boost():
    git_repository(
        name = "com_github_nelhage_rules_boost",
        commit = "1e3a69bf2d5cd10c34b74f066054cd335d033d71",
        remote = "https://github.com/nelhage/rules_boost",
        shallow_since = "1591047380 -0700",
    )

def com_github_jbeder_yaml_cpp():
    new_git_repository(
        name = "com_github_jbeder_yaml_cpp",
        remote = "https://github.com/jbeder/yaml-cpp.git",
        tag = "yaml-cpp-0.6.3",
        build_file = "@//bazel/externel:yaml_cpp.BUILD",
        # build_file = "yaml_cpp.BUILD",
    )

def websocketpp():
    new_git_repository(
        name = "websocketpp",
        remote = "https://github.com/zaphoyd/websocketpp.git",
        tag = "0.8.2",
        build_file = "@//bazel/externel:websocketpp.BUILD",
    )

def bazel_compdb():
    http_archive(
        name = "com_grail_bazel_compdb",
        sha256 = "171828822d61d2361ebc24e61050d3495846a1c48ee94eea79e8b03bc2d86f48",
        strip_prefix = "bazel-compilation-database-master",
        urls = ["https://github.com/grailbio/bazel-compilation-database/archive/master.tar.gz"],
    )