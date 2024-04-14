vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-gate
    REF 7bf42f282e19ed8294b2b0fc4667ae37bf15209d
    SHA512 9bce2c9547b442375f156f08fd5cadda78b49210661ddde6772d6762d403857386cf182edb86aa120c529d3e4127184aa2b36b9c7a24513d2d258b7eefb0865a
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
