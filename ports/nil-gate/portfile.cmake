vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "njaldea/${PORT}"
    REF "v${VERSION}"
    SHA512 29a2dd18c74615acae9e33efcd055e14af8c3eba1fd5a3fb702ddc59c834e9a81af0ff5b55712155804a96e1f3c9c0f687bff9d3669a4f480a37417a85c5bab6
    HEAD_REF master
)

include(${CMAKE_CURRENT_LIST_DIR}/port.cmake)