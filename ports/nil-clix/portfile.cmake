vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-clix
    REF b51924e79a14e087cb89aee18fd4e5811a4cc93d
    SHA512 90f18ef40e73717f9171f97c7b323f01fded18348bf2dda649ada283c2962767c1b218b8f346abe68b27336e4287ecfd32dd0b066ce0707d1780b45dc22459d7
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
