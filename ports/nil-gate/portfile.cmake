vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-gate
    REF 64dbc5b977e9730cf6ae2a188b402b1e0cf943a3
    SHA512 0295014a6eba99fd71df82c602274a671aee648a8b6508092dedbdbd0b56a11f9edba3630ea7db3ce0a78e64f207ed617255118ddb8721f06123c8de19236abf
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
