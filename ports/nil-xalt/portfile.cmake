vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "njaldea/${PORT}"
    REF "v${VERSION}"
    SHA512 9bef149136ede75ba58a5120375292ceadcad6354df728850cc66a59a21a29af9fdb438587180a0308ba8d18524ca504f6e0972f9c92c2f584caf826a5afc76f
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
