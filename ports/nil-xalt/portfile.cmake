vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xalt
    REF ebad5235d322c67a19253b312b4efc2985ba809d
    SHA512 83b0b826b60f60f788455a0dba92b013eca3bde46aae8e6ffe82b21fff2e0170c26cce0524c3732b6016e41e02fb9b0a7416b54ea446fdfb965284a441902655
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
