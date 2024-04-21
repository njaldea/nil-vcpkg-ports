vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-gate
    REF dd2f9129af399d9360a092d5185cbbf679d37da5
    SHA512 6eba94fc29e2fedcf17fafdaef4e78a35918debc726c81e6160c9495f1b24d69cbe685fc47fc5b23bdd8cc1f92ad4b2a3feb6187d2fbe52b0efa051aabd1e7e4
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
