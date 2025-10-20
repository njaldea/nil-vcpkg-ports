vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-gate
    REF v1.5.2
    SHA512 9f886b9923c5f273c604b21b4c7bbcb7b61d975205f1ca0650509921d88c8d808720be2a5d662572b161d524eebdc5f7d101cca3d8006b44d2019faf9104a67d
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