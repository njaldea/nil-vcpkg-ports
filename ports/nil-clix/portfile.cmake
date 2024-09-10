vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-clix
    REF 703964d8004a9bda498984cb0211c2d7d477a02a
    SHA512 c3cb6b4ab59cbb953e0cbab97beb9afde8f14b29f6195ca812c74d133cd283ca214b85f20d2c100abed67912b3441525d4b08dd2c70982b6cf4d836da4fee7f6
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
