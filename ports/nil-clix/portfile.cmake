vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "njaldea/${PORT}"
    REF "v${VERSION}"
    SHA512 83e311234a081cbbdf4090af0af625b2eefe0c7f3cdb9a0e1b7d11234ed68f7d89fa7ac3573ff33d09ffb4807bea3f46c2fdc038a453f50fd1b093f093923489
    HEAD_REF master
)

include(${CMAKE_CURRENT_LIST_DIR}/port.cmake)