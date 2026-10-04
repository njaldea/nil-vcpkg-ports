vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "njaldea/${PORT}"
    REF "v${VERSION}"
    SHA512 a65ee372311b4fbb3e8f3a70584ddbd6e195dcc7e5d199dcf7ce5b0a3bf240c2addfb74f8cbf64846ea1d5b6da21b2030d5353de599c5cda3b9e36daeb71493f
    HEAD_REF master
)

include(${CMAKE_CURRENT_LIST_DIR}/port.cmake)

if (DEFINED ENV{NIL_BUILD_CPACK_DEB} AND "$ENV{NIL_BUILD_CPACK_DEB}" STREQUAL "1")
    set(BUILD_DIR "${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-rel")
    message(STATUS "Running CPack in build directory ${BUILD_DIR}")

    execute_process(
        COMMAND cpack -G DEB -D CPACK_OUTPUT_FILE_PREFIX=$ENV{NIL_CPACK_OUT_DIR}
        WORKING_DIRECTORY ${BUILD_DIR}
    )
endif()
