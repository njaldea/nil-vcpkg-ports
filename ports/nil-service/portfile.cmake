vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF 54ad52048564145934b711d81fd1687f51dbc32a
    SHA512 490a1b6c1449b12a936e9d772bff49d93c48b5492124c6b30cb88a08a77722ce5cf80ea7d85cc448709dd1eb3d4307f84f24e8013ccbdfff0b2faee1efe415d5
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
