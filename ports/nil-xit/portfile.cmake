vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xit
    REF 7910f29fc81e40baff8b8a27f83cd6d1a2d7ec89
    SHA512 5608f83ffe776581c289156dab4ded28c3f8f7d0facec9af9c0bc02638ff316165028317da4e2b125b64552a505be70eb6cf251c3b186bec8ef67aa288f8b28b
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
