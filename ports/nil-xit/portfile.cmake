vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xit
    REF c9940be3e761373383e966e61ab3ffde1d391c95
    SHA512 f5332375d19727412058ac78eff04bd6850985088e3167bd018f5ce044c8d72c5887f5bd961a97f716c538e80fd2da0077bdaccf8a414da4a5ecd60bdd8b0b63
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
