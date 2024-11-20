vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xit
    REF 2f24bbe189dc4e285382db30bdc6a2195fadbe3d
    SHA512 1fc9b85d7362e4474a5d84aa88bca8ad3e4c8ffa64eef086c24a909a37b6a274a8d2ed8d9ca63487587cf4cb044d39df39ca46ee9c26e9c492ac3e90edf64a7f
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
