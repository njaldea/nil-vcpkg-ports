vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "njaldea/${PORT}"
    REF "v${VERSION}"
    SHA512 cb9c782a599821edce4514f07b7ab0577ff571421d1ed84638a2214e7dd1de7e3eb934fa309c54607529eef9b764ccc7af5b32265cb1263319988c48d96c4596
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