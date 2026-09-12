vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "njaldea/${PORT}"
    REF "v${VERSION}"
    SHA512 9dc0ed44d40e76ffc1a795f8250196837dd0f2db51efe58bebff387f221fa5f5746c58613b335fa2fc62ecd3debd032c8b956c439c710e793cd6b37f83f74d95
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
