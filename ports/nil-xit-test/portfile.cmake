vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "njaldea/${PORT}"
    REF "v${VERSION}"
    SHA512 fa40ae2272afa1dc505fec7ab036c8ffdbacc4876b0a6809722e4d3cf7a53be2488951c4621742d162397391754699b3183a8b9edf384a4d20e21dc05f2d5b53
    HEAD_REF master
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        gtest          ENABLE_FEATURE_GTEST
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS ${FEATURE_OPTIONS}
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/${PORT}")
vcpkg_install_copyright(FILE_LIST "${CURRENT_PACKAGES_DIR}/share/doc/${PORT}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

set(USAGE_FILE ${CURRENT_PACKAGES_DIR}/share/${PORT}/usage)
file(WRITE  ${USAGE_FILE} "nil-xit-test provides CMake targets:\n\n")
file(APPEND ${USAGE_FILE} "    find_package(nil-xit-test CONFIG REQUIRED)\n")
file(APPEND ${USAGE_FILE} "    target_link_libraries(TARGET PUBLIC nil::xit-test)\n\n")
file(APPEND ${USAGE_FILE} "    # for nil::xit-gtest\n")
file(APPEND ${USAGE_FILE} "    find_package(nil-xit-test CONFIG REQUIRED COMPONENTS gtest)\n\n")
file(APPEND ${USAGE_FILE} "    # register a test\n")
file(APPEND ${USAGE_FILE} "    add_xit_test(\n")
file(APPEND ${USAGE_FILE} "        TARGET\n")
file(APPEND ${USAGE_FILE} "        SOURCES\n")
file(APPEND ${USAGE_FILE} "            <your files...>\n")
file(APPEND ${USAGE_FILE} "        GROUPS\n")
file(APPEND ${USAGE_FILE} "            <key=value...>\n")
file(APPEND ${USAGE_FILE} "    )\n")
file(APPEND ${USAGE_FILE} "    target_link_libraries(TARGET PUBLIC nil::xit-gtest)\n\n")