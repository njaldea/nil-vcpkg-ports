vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xit
    REF f2b2ce0cd3903a70006ddfb7fca9934736e20bbf
    SHA512 43bbb599ab056d42a713de1b05b4b821427e0dff2a1023f8a74420f07d3b3c8b3a22a71f1400cd5030ed7a704a0e58a692e88eb933e88f2b20b1a90bd7a4a365
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
