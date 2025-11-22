vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "njaldea/${PORT}"
    REF "v${VERSION}"
    SHA512 1f5bd0650e145df8caa545bca5456b90ecb6e4e9b2ca4efd8fbdfadefcd6c57d9b4f2a404190ce2ed94f1d73f8faf6ad07df9ec389ba589a1f8f2578533e4284
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
vcpkg_cmake_config_fixup(CONFIG_PATH "share/${PORT}-${VERSION}")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

set(USAGE_FILE ${CURRENT_PACKAGES_DIR}/share/${PORT}/usage)
file(WRITE  ${USAGE_FILE} "nil-gate provides CMake targets:\n\n")
file(APPEND ${USAGE_FILE} "    find_package(nil-gate CONFIG REQUIRED)\n")
file(APPEND ${USAGE_FILE} "    target_link_libraries(TARGET PUBLIC nil::gate)\n\n")
file(APPEND ${USAGE_FILE} "    # for nil::gate-c-api\n")
file(APPEND ${USAGE_FILE} "    find_package(nil-gate CONFIG REQUIRED COMPONENTS c-api)\n")
file(APPEND ${USAGE_FILE} "    target_link_libraries(TARGET PUBLIC nil::gate-c-api)\n\n")