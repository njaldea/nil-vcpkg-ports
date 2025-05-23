vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xit
    REF 1824284d50c18fd8b788cbd356df18e8c478e6d4
    SHA512 0408127614ea43a37bc07ca73750f2f9c7d5e449e921ae65ea6972e1fa69cc9e87ea1eec8614bad830e52076537382d81b28c7ed00a4a6ac30c52a32ed31c85d
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
