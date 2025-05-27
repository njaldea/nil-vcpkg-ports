vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF b0e9e5abf9cc77302d0230b68d5b8f2390a5b317
    SHA512 a49c955a27719e9701d9108dd3b23e611946737f8d532e2b858b51edd912001559e9ab495ce4fec94cca73678d542a909fbcb906eec61c381b7aea8de425fc39
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