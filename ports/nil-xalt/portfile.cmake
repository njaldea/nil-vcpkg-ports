vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "njaldea/${PORT}"
    REF "v${VERSION}"
    SHA512 563a839bce7c2f4f1c6993693cd2374350df3a3a27cda163ef6416beaf2e922c029151eb1ac671b7b6b5736757e0b44c466aed8a1eef1362fa9f25a463f0c833
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
