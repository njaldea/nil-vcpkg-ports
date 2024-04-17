vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-clix
    REF eed75024e21fd4422b11047dae7497e51d05b6e0
    SHA512 41c452c0e385377d7f09e32ca51b90ba1d4f1d9cfaccdb496d47c202e73be9b534026d8ae63fee940802a4f625b372db1f11a80d4e579e467f5bd56ab676d640
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
