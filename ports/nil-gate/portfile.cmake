vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-gate
    REF v1.5.1
    SHA512 20163d62799a9f499f9dea5114df954051f0052fb03f0e9e29adfd82cd965b655f89e6000c04ebcb2ef45e719f58ab676f4960801cc9b03b5ad2173035901ee0
    HEAD_REF master
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        c-api          ENABLE_C_API
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
file(WRITE  ${USAGE_FILE} "nil-gate provides CMake targets:\n\n")
file(APPEND ${USAGE_FILE} "    find_package(nil-gate CONFIG REQUIRED)\n")
file(APPEND ${USAGE_FILE} "    target_link_libraries(TARGET PUBLIC nil::gate)\n\n")
file(APPEND ${USAGE_FILE} "    # for nil::gate-c-api\n")
file(APPEND ${USAGE_FILE} "    find_package(nil-gate CONFIG REQUIRED COMPONENTS c-api)\n")
file(APPEND ${USAGE_FILE} "    target_link_libraries(TARGET PUBLIC nil::gate-c-api)\n\n")