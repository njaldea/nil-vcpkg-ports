vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-gate
    REF 62869b0247b79f4bbd4de9e3deb30c98f86b0f9c
    SHA512 871f14b9e1ee6e512172da2873684a0aaf73ddceed0b12154b5c1a2ea8f7aec9b79bbe5360dad20c30a456bbe79c6c15789978d1aaa71ccbdf57b91fab22f577
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
