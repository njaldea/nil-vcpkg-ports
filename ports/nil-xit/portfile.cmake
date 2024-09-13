vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xit
    REF 80be561e6440c18731c86697319143340699b9ef
    SHA512 aa820fadd69c2824b92b7094e5e085b2dfba1eaacebdb66ea94f444bbd9d5543d662ba61ccbb60ecea9c0c1b8fbe379d95ea2c88ea6305f24b8c8b64188def09
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
