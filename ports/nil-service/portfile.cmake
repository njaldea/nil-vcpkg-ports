vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF 9dda500438cf30394d3c91b7cf5157baa7534372
    SHA512 d8df7c0ae824a0d854fc33eddfd3b2ff99c2ebc3bb72d1ce04b2512b881ec7f224fa632073324c92bbf304153076b410ebda95a3820c810b266e1b4ffae629e7
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
