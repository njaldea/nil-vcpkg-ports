set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
set(VCPKG_POLICY_ALLOW_EMPTY_FOLDERS enabled)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "njaldea/${PORT}"
    REF "v${VERSION}"
    SHA512 e34d1f33c6b8890c2db9f315ff9dde09c89a8bf43df99c0c8261d84e5aec142f1a5a4b271a547095bb80606023f23c031f55d99db64e852ec2d3c8f1cb34e8cd
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