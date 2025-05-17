vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF ec4097dfcffef09ad0efc150916bfe76e618e386
    SHA512 ed247f32b5e543c5b421a6f8d916dbea8f500cca046255762930fe0afe360d8738d847516afc0d6ebd2fab2d21c4e7d0c8bfc0f8b2abc834939d5b8945ba6353
    HEAD_REF master
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        ssl          ENABLE_SSL
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
file(WRITE  ${USAGE_FILE} "nil-service provides CMake targets:\n\n")
file(APPEND ${USAGE_FILE} "    find_package(nil-service CONFIG REQUIRED)\n")
file(APPEND ${USAGE_FILE} "    target_link_libraries(TARGET PUBLIC nil::service)\n\n")
file(APPEND ${USAGE_FILE} "    # for nil::service_ssl\n")
file(APPEND ${USAGE_FILE} "    find_package(nil-service CONFIG REQUIRED COMPONENTS ssl)\n")
file(APPEND ${USAGE_FILE} "    target_link_libraries(TARGET PUBLIC nil::service_ssl)\n\n")