vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF f06ec76df6892cdaf3a592cd84013407d71b0480
    SHA512 5b78ab0d52a0e03a6814f9d93bc9406955d187497653dbda0f420dc84adf8ea130472baa403303c4fac959deef491038d015398604bc382ca317dbb7636c7857
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

# file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
