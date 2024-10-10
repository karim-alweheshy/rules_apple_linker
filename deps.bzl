"""Register default linker downloads"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def rules_apple_linker_deps():
    http_archive(
        name = "rules_apple_linker_lld",
        build_file_content = 'filegroup(name = "lld_bin", srcs = ["ld64.lld"], visibility = ["//visibility:public"])',
        integrity = "sha256-xdx8XYEELpZO4vm6uv8fYp8+i7oAUagTgJ94dwSd/jE=",
        url = "https://github.com/karim-alweheshy/ld64.lld/releases/download/10-10-2024/ld64.lld.tar.gz",
    )

def _impl(_):
    rules_apple_linker_deps()

linker_deps = module_extension(implementation = _impl)
