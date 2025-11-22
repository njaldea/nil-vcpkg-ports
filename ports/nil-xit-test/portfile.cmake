vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "njaldea/${PORT}"
    REF "v${VERSION}"
    SHA512 43b763603fc22f620af87cc33ace2d7a2dd57e686479f02858d437270d2586ef41be9797497afcc878b89e01eb4b0d3397991b4bae3fe7ac15013c11e668f701
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