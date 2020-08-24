load("//bazel/extern:externel_repository.bzl",
    "foreign_cc_",
)
# BUILD_ALL_CONTENT = """filegroup(name = "all", srcs = glob(["**"]), visibility = ["//visibility:public"])"""

# 需要提前加载的构建所需工具链
def builder_repositories():
    foreign_cc_()
    






