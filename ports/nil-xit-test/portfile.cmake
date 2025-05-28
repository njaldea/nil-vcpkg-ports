vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xit-test
    REF v1.0.0
    SHA512 3fbf775658c0880272ffcf6c85ae2847cc24fa4c6b4b7203686183f52e3863c4bd4292fc177308df492b211170b12d3ab9795ca8dac368095d5a2d1a02757925
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