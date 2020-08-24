# load("@varys_api//bazel:api_repositories.bzl", "api_dependencies")
load("//bazel/externel:externel_repository.bzl", 
    "com_google_absl",
    "google_test",
    "com_github_jbeder_yaml_cpp",
    "com_github_glog",
    "rapidjson",
    "websocketpp",
)

load("@com_github_nelhage_rules_boost//:boost/boost.bzl", "boost_deps")

BUILD_ALL_CONTENT = """filegroup(name = "all", srcs = glob(["**"]), visibility = ["//visibility:public"])"""

def dependency_repositories():
    api_dependencies()
    com_google_absl()
    com_github_jbeder_yaml_cpp()
    com_github_glog()
    rapidjson()
    websocketpp()
    boost_deps()
    
    # protobuf 依赖
#    rule_proto_repository()

# 测试工具链
def test_respositories():
    google_test()






