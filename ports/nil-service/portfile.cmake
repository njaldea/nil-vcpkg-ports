vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF 3ed443c0e7e247538864cb27b20986eedef8d22d
    SHA512 fe7787435c0ce1e124ae4a261ae2132435105c699e4aa43d933d290c0c22b6594b25bfe4a47c772125a7b48b0f7d70bac0ff45141abbdc76ba26585df0ee7110
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

# file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
