vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-gate
    REF 1f2243d14b67b7718182ffa7508cfb5dce1a5c9a
    SHA512 4f3172f52c5af6b38071ae88b2bd8c4783c711598a1d2bb6d715e02432b3ad03a27c2875c7cbb5e131b9971faf39286b48daa74a3e7bbed5ec8b36fe7dcc9b6a
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
