set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
set(VCPKG_POLICY_ALLOW_EMPTY_FOLDERS enabled)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/${PORT}")
vcpkg_install_copyright(FILE_LIST "${CURRENT_PACKAGES_DIR}/share/doc/${PORT}/LICENSE")

set(USAGE_FILE ${CURRENT_PACKAGES_DIR}/share/${PORT}/usage)
file(WRITE  ${USAGE_FILE} "nil-cmake provides CMake targets:\n\n")
file(APPEND ${USAGE_FILE} "    find_package(nil-cmake CONFIG REQUIRED)\n\n")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")