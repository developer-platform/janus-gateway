def _default_varys_api_impl(ctx):
    ctx.file("WORKSPACE", "")
    api_dirs = [
        "BUILD",
        "bazel",
        "varys"
    ]
    for d in api_dirs:
        ctx.symlink(ctx.path(ctx.attr.varys_root).dirname.get_child(ctx.attr.reldir).get_child(d), d)

_default_varys_api = repository_rule(
    implementation = _default_varys_api_impl,
    attrs = {
        "varys_root": attr.label(default = "@varys_sentinel//:BUILD"),
        "reldir": attr.string(),
    },
)

def api_binding():
    # Treat the data plane API as an external repo, this simplifies exporting
    # the API to https://github.com/varysproxy/data-plane-api. This is the
    # shadow API for varys internal use, see #9479.
    if "varys_api" not in native.existing_rules().keys():
        _default_varys_api(name = "varys_api", reldir = "api")

#    # We also provide the non-shadowed API for developer use (see #9479).
#    if "varys_api_raw" not in native.existing_rules().keys():
#        _default_varys_api(name = "varys_api_canonical", reldir = "api")

#    # TODO(https://github.com/varysproxy/varys/issues/7719) need to remove both bindings and use canonical rules
#    native.bind(
#        name = "api_httpbody_protos",
#        actual = "@com_google_googleapis//google/api:httpbody_cc_proto",
#    )
#    native.bind(
#        name = "http_api_protos",
#        actual = "@com_google_googleapis//google/api:annotations_cc_proto",
#    )
