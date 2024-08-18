vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF edabc95f498719bc5cc989ed3e2ba454d5aa8c1a
    SHA512 00d325af602e70389d9f292d53ae0e73600cb4ee23bd4eca1f8eea98a559d350ca7b00b1068dc682b37d11cffea59eb7aeb96d47998dccad8f4437bb0c13bd6b
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
