vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xit-test
    REF 250b11e12163198a6c2d708ed24a244fa4121393
    SHA512 607ccabce639aa9fcf512133f8c48da7bedb297e9f42665c40a8d896f70b014d2bec7a925cd5aaf241470cbd676b19b030f54437f6c2106e304efab9310c0ea9
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
file(APPEND ${USAGE_FILE} "    find_package(nil-xit-test CONFIG REQUIRED COMPONENTS gtest)\n")
file(APPEND ${USAGE_FILE} "    target_link_libraries(TARGET PUBLIC nil::xit-gtest)\n\n")