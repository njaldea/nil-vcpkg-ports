vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-gate
    REF 17293f8dc5a11e9ffac02400777f854f5b3cadf0
    SHA512 7714e307a43cf566e5c9c4773eb297ee9e5259a5c554ed3597c79a9191f7c3b1ed3b731fd6855ff82b1022484771046db5293c11843a300d43aa5d30328bf916
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
