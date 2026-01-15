vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "njaldea/${PORT}"
    REF "v${VERSION}"
    SHA512 29a2dd18c74615acae9e33efcd055e14af8c3eba1fd5a3fb702ddc59c834e9a81af0ff5b55712155804a96e1f3c9c0f687bff9d3669a4f480a37417a85c5bab6
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
vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/${PORT}")
vcpkg_install_copyright(FILE_LIST "${CURRENT_PACKAGES_DIR}/share/doc/${PORT}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

set(USAGE_FILE ${CURRENT_PACKAGES_DIR}/share/${PORT}/usage)
file(WRITE  ${USAGE_FILE} "nil-gate provides CMake targets:\n\n")
file(APPEND ${USAGE_FILE} "    find_package(nil-gate CONFIG REQUIRED)\n")
file(APPEND ${USAGE_FILE} "    target_link_libraries(TARGET PUBLIC nil::gate)\n\n")
file(APPEND ${USAGE_FILE} "    # for nil::gate-c-api\n")
file(APPEND ${USAGE_FILE} "    find_package(nil-gate CONFIG REQUIRED COMPONENTS c-api)\n")
file(APPEND ${USAGE_FILE} "    target_link_libraries(TARGET PUBLIC nil::gate-c-api)\n\n")