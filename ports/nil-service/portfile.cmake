vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF f456389c460a78ea65365ec6f31b05139d6a5269
    SHA512 aa2a4e55522836f33af77907c30c7e9b094cd5cf20f97858db47c6f8792748b54f44cb295e7fe1a1780b55f472acba6f718cd6fe7a3c7d22b7bc132e28f15831
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
