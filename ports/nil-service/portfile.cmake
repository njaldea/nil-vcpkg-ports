vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF 80b2089504f6dc28f234fc32dc8e8dbd136c1c2f
    SHA512 2ad7871e8a6e96445aa7a961ddeea8ea6f0a0404c8d1883bee0a4d56a079b4a0c87598e4a96d328322bb27a79457f663226040e9dde35fa49e8fbf645aaf5172
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
