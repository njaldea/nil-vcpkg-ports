vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xit-test
    REF 4db1a195671a89c238cd9a385c06b0e66d138c34
    SHA512 607c36676740c3e47bf2dc38227c6192dc08489252080dcce41bdbedea6d1200a5f6273cdb31840eb6c99eacc08de21408ab6ae8ae5155938bd50a25a52b6b5c
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