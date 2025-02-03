vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xit
    REF a7f07d44a2ecc68a38d5bfed4fe28fe0cd7f4052
    SHA512 d75634dfe04990aa404fe815134dfef8365ad625bfd45cb1e1e4c3bf4076d0a77daafc25b84029fee114ac4953190d397ec16e7eade4656633375ff72f77a5ea
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
