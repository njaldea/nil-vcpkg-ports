vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "njaldea/${PORT}"
    REF "v${VERSION}"
    SHA512 f5d856e57b343eddb15d6e3ac2d201958f657f45aab2fc7d1ceae267b8ed462d489122db884805a11211127b4c8f7d23f1bf091cb75a4e40f31c1cebafde2cda
    HEAD_REF master
)

include(${CMAKE_CURRENT_LIST_DIR}/port.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../cpack.cmake)