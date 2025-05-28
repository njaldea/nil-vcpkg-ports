vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-gate
    REF v1.0.0
    SHA512 e038bf92e5093d9400a66cff473cae81b2a42ba9213f4091c07ce7d73c26bed0c0f939fad55150035f5d3d276e6f747d1ad76f62bb2e19921d66465d37b08bd0
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
