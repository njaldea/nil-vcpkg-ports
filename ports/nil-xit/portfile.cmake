vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xit
    REF 5f938f359ce517efd2f95e02c51c2b6aeef962f7
    SHA512 5df79cc142680fbde37d1608375c4b71625ed1aa2c00dec00d396a7e44f35a29385ba7a439edab314fed8fdda065f575edee8439c00a4ed22e4f0b99be54e2e7
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
