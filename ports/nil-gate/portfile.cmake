vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-gate
    REF v1.5.3
    SHA512 788f1f2d70979e923d2897780adb09b6309d1c27bc5d8437a28c04dda8ea07fb04e5410aa6ac5cd96b808297338bae0d239ce9b3c3fcd8cad1d925887928abd5
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