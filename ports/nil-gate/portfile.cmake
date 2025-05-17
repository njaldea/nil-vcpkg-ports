vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-gate
    REF 353bcbf655f900c97107f7f595a7a42ea8d97e02
    SHA512 b59b300b9d278ba1137b2fa1c0f59290940e16fdc350f7bb20598c1f722422c585a60ebba73e31dd3a563b9621bd5299907f1164b158ab7d323a67107f125ea4
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
