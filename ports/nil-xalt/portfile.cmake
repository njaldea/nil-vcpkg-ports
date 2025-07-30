vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xalt
    REF v1.1.0
    SHA512 f65857e56ba932d65f7c52180d14442df46b66a5fc7c31bb380f58a828290b6cfbf079b66f54e90137a98a9e8a7e32798ceccb81fb756a45567ebcc2159c93b7
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
