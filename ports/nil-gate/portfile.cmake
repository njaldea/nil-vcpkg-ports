vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-gate
    REF bb3cfc49a79ba7e1824f2ed153a8dcc8d7e6a680
    SHA512 4ca60cbca5b567b1c8c7cdf234e95b460f4299655bf13ace9546b9e9346ce5f741b1993ffb5e4f15ee574955fe90e5ccb073cd56c030429d79c605c6467847a4
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
