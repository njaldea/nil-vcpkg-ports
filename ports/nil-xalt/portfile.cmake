vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xalt
    REF cad6c127340bce831451b2b4412d3eee4871cf03
    SHA512 4104d43286816fbda56a372212f7180a438d8e891caae0f56605de9bf2c89e4526531c3a792587ee2e03c7a5c4420884616b91b7d668716b739f6c471ba37495
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
