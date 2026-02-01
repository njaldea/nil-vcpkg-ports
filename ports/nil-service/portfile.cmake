vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "njaldea/${PORT}"
    REF "v${VERSION}"
    SHA512 ed46e4b929eb042831bf97e3cdfd4d7bbd6cf4d2da3bd1d5f1bab42d23d7f51292c15b74f5b4810dd8ad1374e3f512d4ccb9c5808f48e339637f842de8106b14
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
vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/${PORT}")
vcpkg_install_copyright(FILE_LIST "${CURRENT_PACKAGES_DIR}/share/doc/${PORT}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

set(USAGE_FILE ${CURRENT_PACKAGES_DIR}/share/${PORT}/usage)
file(WRITE  ${USAGE_FILE} "nil-service provides CMake targets:\n\n")
file(APPEND ${USAGE_FILE} "    find_package(nil-service CONFIG REQUIRED)\n")
file(APPEND ${USAGE_FILE} "    target_link_libraries(TARGET PUBLIC nil::service)\n\n")
file(APPEND ${USAGE_FILE} "    # for nil::service_ssl\n")
file(APPEND ${USAGE_FILE} "    find_package(nil-service CONFIG REQUIRED COMPONENTS ssl)\n")
file(APPEND ${USAGE_FILE} "    target_link_libraries(TARGET PUBLIC nil::service-ssl)\n\n")