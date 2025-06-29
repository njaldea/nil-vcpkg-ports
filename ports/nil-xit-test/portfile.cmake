vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xit-test
    REF v0.0.4
    SHA512 b2128ad0d40c26b413f7c36ba23737b3f90a6e583ff0503f00b3edfe9e426fdc6148f0fac5c45752a9e0539731b5f91f1268d3fdb227d0b48d82fbc739e8a076
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