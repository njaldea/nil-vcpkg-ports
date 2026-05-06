vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "njaldea/${PORT}"
    REF "v${VERSION}"
    SHA512 aac7505a08552aa64d161f1fa6437dfa4a85892cdc439b21a16d3a83e1280735527bc9a6d1cd8a12280d85c983ef4dd2a94e2d1236e34907fc03dbd3fff3a8a5
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
