vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        c-api          ENABLE_C_API
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS ${FEATURE_OPTIONS}
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/${PORT}")
vcpkg_install_copyright(FILE_LIST "${CURRENT_PACKAGES_DIR}/share/doc/${PORT}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

set(USAGE_FILE ${CURRENT_PACKAGES_DIR}/share/${PORT}/usage)
file(WRITE  ${USAGE_FILE} "nil-xit provides CMake targets:\n\n")
file(APPEND ${USAGE_FILE} "    find_package(nil-xit CONFIG REQUIRED)\n")
file(APPEND ${USAGE_FILE} "    target_link_libraries(TARGET PUBLIC nil::xit)\n\n")
file(APPEND ${USAGE_FILE} "    # for nil::xit-c-api\n")
file(APPEND ${USAGE_FILE} "    find_package(nil-xit CONFIG REQUIRED COMPONENTS c-api)\n")
file(APPEND ${USAGE_FILE} "    target_link_libraries(TARGET PUBLIC nil::xit-c-api)\n\n")

if (DEFINED ENV{NIL_UPLOAD_PYPI} AND "$ENV{NIL_UPLOAD_PYPI}" STREQUAL "1")
    set(BUILD_DIR "${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-rel")
    message(STATUS "Running ffi-python-upload in build directory ${BUILD_DIR}")

    execute_process(
        COMMAND ${CMAKE_COMMAND} --build . --target ffi-python-upload
        WORKING_DIRECTORY ${BUILD_DIR}
    )
endif()
