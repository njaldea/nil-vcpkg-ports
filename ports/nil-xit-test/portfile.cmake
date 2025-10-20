vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xit-test
    REF v0.0.10
    SHA512 850000c8cefcdbe1546fd830b9876075a1d61e9d898dc4b1c1673fe8c62743f71d4ccf29e54871ffe1eff58eab05f3cdd18dbd903536ea335821896a3ffa2979
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
vcpkg_cmake_config_fixup()
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