vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-gate
    REF v1.2.0
    SHA512 5cc330ac8e64c105933c3f60fe508d5e95d9efd399c40b55249df79a71395f5314c77c5f877f18c51d323343168b378d4604c30a9f2653866b4ee012c201fc49
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
