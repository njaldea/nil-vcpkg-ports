vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "njaldea/${PORT}"
    REF "v${VERSION}"
    SHA512 ed46e4b929eb042831bf97e3cdfd4d7bbd6cf4d2da3bd1d5f1bab42d23d7f51292c15b74f5b4810dd8ad1374e3f512d4ccb9c5808f48e339637f842de8106b14
    HEAD_REF master
)

include(${CMAKE_CURRENT_LIST_DIR}/port.cmake)