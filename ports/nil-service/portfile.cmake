vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF 0e2e7bfa05964f4a900a7bd9c68b95e80ff8a066
    SHA512 3a7df77bc3b6c9266e90a06de90297693960dd2b72752fb8aade2289086ba63a79c4930ac30be35d587c37b1481f21df45bc120b38afe10c540be2851b2abc96
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
