vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-gate
    REF 774a75ec67a4d4c5988a84716f016f6d3fffce8b
    SHA512 8f1140c689e8c1d0fbb3bb44a3e5d6a592ed4dc0e489789eee2a6c44858b30d3ceb679905a6aacbc60f1a6bef5b262cecbbede04c97507e469c4117119105589
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
