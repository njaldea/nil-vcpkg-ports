vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xalt
    REF f6c958b4551b5f40dfde5fa3ba6e1a6092fcc779
    SHA512 dc38245ce0cb5d4b6bc2404456d878af87fbbf4800d805b10c2aee0261ff3bb7047fe23723dbf6ff7bbf1dff9ead83e8d3066372d9aa6e8aee1bcb3194d8ddcc
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
