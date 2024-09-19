vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xit
    REF dc8074016cd5a9d09d5c99ecf418ab527dd2ec90
    SHA512 413dd125b06f2ff6c4ff60efbccc329642a67978ace4313d80f0b63046a7c8ec460442355a2a95a61c2478420b3f678aeb0297203c2c7bfc7ceb97058bd9cf75
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
