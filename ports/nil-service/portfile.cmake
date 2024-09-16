vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF d5533e4732bcd828dc489c420a76c59849331b89
    SHA512 a933ea8e766f8eea0475d154c2ccee346ce7d2173ca8268f189f240bb0060ff97cb204e788ff78f6bba380fdfbb0c2fb3e2529c1662a39f930d406afc23052dc
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
