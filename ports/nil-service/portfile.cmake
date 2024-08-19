vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF f345791691089d28097b29287055a73eb2de9ca8
    SHA512 5c550c0b84f9eb281a5f5a0a7b97d2e4e3e869013175be4f69d6f7ccc292649ca22deee79315e6caf6afc00b875c3ba959af9b0d557488198d708ae78bcc8384
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
