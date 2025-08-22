vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-gate
    REF v1.4.0
    SHA512 98840a0ec22965dd8bb4e1e8d5c9036e9098231d997e90d9255f820aa357435e43c2c2283cb244f1d8371dd83ff34cf7c60a12819ae6dd90163a087ba23fa55d
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
