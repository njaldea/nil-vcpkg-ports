vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "njaldea/${PORT}"
    REF "v${VERSION}"
    SHA512 d9d619327574c8de83a3f19233baddfa376ebd941a5851d1928f8950d16b1459ba8b30826ffd8eed464ceaa0003dfbf265c38477f0a8ecf166b3f54b1fba98ac
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/${PORT}")
vcpkg_install_copyright(FILE_LIST "${CURRENT_PACKAGES_DIR}/share/doc/${PORT}/LICENSE")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")