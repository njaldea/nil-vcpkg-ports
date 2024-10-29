vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-gate
    REF 8fd00d00c2e1d2b562d5709ea4b25e1e8d1dbd3e
    SHA512 8e18ac1f8b08d0a4b3646da691a40ade3c9b71a8ae9587a2cd4e7945df3440e0f2efd68c209d51b74d40e7066b6ea9be23335dd447bcd260b1ef74cf83cc19b7
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
