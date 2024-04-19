vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF e553a7a64438655be90b9aee0a2793a504d8baa4
    SHA512 1ce0caaf9e5d8c688d5e4d21ff6d4d08d9d28e74a1f3eee0b03eef0d88471dd2d62478d59a20a7da9f4727c93c8cba19672f98b0c46153c96a2a3227b4528a56
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
