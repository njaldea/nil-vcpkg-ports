vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-clix
    REF db4ec029b12ea4cb8987e5caca7a8a4d76fe737e
    SHA512 8fc8767a8264dc3e86cf6e2a20c46d5474a9897ca2566b610fb36b16995dd1027c62251ec4d16d5b1b4ce2fee1e57fea68e8508811c6bbe27cf4a395ff08955e
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
