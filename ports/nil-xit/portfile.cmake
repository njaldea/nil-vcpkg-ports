vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xit
    REF 59ff51e25bcbb2f33f5dd88a1b8a16926bba9cbd
    SHA512 90d9bca343b340aad07c73cee89dd4ff22c5a69d8d88c25d5b70676758ae6fd8ab7781c07e162488c9e6668d21f2101209cd6668394cd3588ca68cc1620a9baa
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
