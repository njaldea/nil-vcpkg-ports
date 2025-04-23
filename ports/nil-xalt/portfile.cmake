vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xalt
    REF fbbfb6533c84b8e1e688d82d7d62ed8c79d1232c
    SHA512 25b73be627b29f88bebd0c5a5fcf77f1b689eddbf2e30ef837515bd8d26017c0582281baf43d5b5dfd6a3d8716e2a6ed98e0934a36d71c9658e7fcc42e3b2006
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
