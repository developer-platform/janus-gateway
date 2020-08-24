load("//bazel/externel:externel_repository.bzl", 
    "com_github_nelhage_rules_boost",
    "foreign_cc_",
    "bazel_compdb"
)


# BUILD_ALL_CONTENT = """filegroup(name = "all", srcs = glob(["**"]), visibility = ["//visibility:public"])"""

# 需要提前加载的构建所需工具链
def builder_repositories():
    foreign_cc_()
    com_github_nelhage_rules_boost()
    bazel_compdb()
    






