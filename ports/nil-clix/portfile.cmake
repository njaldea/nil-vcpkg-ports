vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-clix
    REF f15016de1479af33a67a7a5cf9d917e20e7d7bd6
    SHA512 2b5bb7b76e9f202b739d965be4f0d1cd39f7e08867b77b01182ec93f65e8fef7d7aec36341fb0564a361cef5729eab33cdf8fd486e6365ca1084cb053f94b3a8
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
