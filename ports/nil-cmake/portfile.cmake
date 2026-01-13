set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
set(VCPKG_POLICY_ALLOW_EMPTY_FOLDERS enabled)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "njaldea/${PORT}"
    REF "v${VERSION}"
    SHA512 c445c94adff636c705a0493877e62d8eef76c35a8a14801ff4be923d922f00d3583ba60ef066f9f3eb791dc82e5d2a564967fc41c7f115a7be43b22117f931ed
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/${PORT}")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(USAGE_FILE ${CURRENT_PACKAGES_DIR}/share/${PORT}/usage)
file(WRITE  ${USAGE_FILE} "nil-cmake provides CMake targets:\n\n")
file(APPEND ${USAGE_FILE} "    find_package(nil-cmake CONFIG REQUIRED)\n\n")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")