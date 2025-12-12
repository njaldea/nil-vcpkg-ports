set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
set(VCPKG_POLICY_ALLOW_EMPTY_FOLDERS enabled)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "njaldea/${PORT}"
    REF "v${VERSION}"
    SHA512 31a2021fdf44678c1d966e7bcbc03d146af616879f29048c8ed6e1b23e8589317fd6b3883aadc599aa68b99c58ece8e91e0f6f72334c622822b40c9194cf3732
    HEAD_REF v0.0.1
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/${PORT}")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(USAGE_FILE ${CURRENT_PACKAGES_DIR}/share/${PORT}/usage)
file(WRITE  ${USAGE_FILE} "nil-cmake provides CMake targets:\n\n")
file(APPEND ${USAGE_FILE} "    find_package(nil-cmake CONFIG REQUIRED)\n\n")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")