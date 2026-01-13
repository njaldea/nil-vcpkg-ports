vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "njaldea/${PORT}"
    REF "v${VERSION}"
    SHA512 22809fc5d8f7598b2e81e45447b11445a7d9fdeea106dbfd9baf4b90490fe3373514dcbceeba62f8fb84ae7651e88693780d543a9737c8165eccb92ea7fa86a2
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/${PORT}")
vcpkg_install_copyright(FILE_LIST "${CURRENT_PACKAGES_DIR}/share/doc/${PORT}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib")
