vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "njaldea/${PORT}"
    REF "v${VERSION}"
    SHA512 2e20510b2b24387b31365818c789240cf0b1e7e0c2b9ed6da121202b0a63ab9708e4207a87b88d10922b8e7c6e5d96c99b7712f60f4c32da617832c788dd2e8e
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
vcpkg_cmake_config_fixup(CONFIG_PATH "share/${PORT}-${VERSION}")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

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