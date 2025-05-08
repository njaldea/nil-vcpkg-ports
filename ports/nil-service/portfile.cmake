vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF 220dad44ed80e834c46ed1ad27892aba3abff78d
    SHA512 103bbf65c95d78bde9d6dc2d1affe202990ab3e8e3d5c8150d7070d86faaf57737421b85d6711e0c1d9b8bc79169de7feb0a9c54d2e45f02c61246d9f5e826fa
    HEAD_REF master
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        ssl          ENABLE_SSL
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS ${FEATURE_OPTIONS}
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

set(USAGE_FILE ${CURRENT_PACKAGES_DIR}/share/${PORT}/usage)
file(WRITE  ${USAGE_FILE} "nil-service provides CMake targets:\n\n")
file(APPEND ${USAGE_FILE} "    find_package(nil-service CONFIG REQUIRED)\n")
file(APPEND ${USAGE_FILE} "    target_link_libraries(TARGET PUBLIC nil::service)\n\n")
file(APPEND ${USAGE_FILE} "    # for nil::service_ssl\n")
file(APPEND ${USAGE_FILE} "    find_package(nil-service CONFIG REQUIRED COMPONENTS ssl)\n")
file(APPEND ${USAGE_FILE} "    target_link_libraries(TARGET PUBLIC nil::service_ssl)\n\n")