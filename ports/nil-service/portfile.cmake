vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF v1.0.0
    SHA512 c9109ffa3523d281dd4435ce9946922af4f822b112bb725ffb2427f019f617b5509d86c80891d9690e6cb1a77506bbcb3d8beafff2c9492d00e623df86f2ed8f
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