vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "njaldea/${PORT}"
    REF "v${VERSION}"
    SHA512 91af160b8ce737efc54fa079e51e4205bf037d9a922d26f868dd021c401aea6d28b86bba6f7ab9fcae9a4ad9ae7069217eacf6f73e9318a5a846d8e8556824c3
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

if (DEFINED ENV{NIL_UPLOAD_PYPI} AND "$ENV{NIL_UPLOAD_PYPI}" STREQUAL "1")
    set(BUILD_DIR "${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-rel")
    message(STATUS "Running ffi-python-upload in build directory ${BUILD_DIR}")

    execute_process(
        COMMAND ${CMAKE_COMMAND} --build . --target ffi-python-upload
        WORKING_DIRECTORY ${BUILD_DIR}
    )
endif()