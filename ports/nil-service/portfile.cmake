vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF 5982b5386c2b72e98799551d7dc388f51cbbce8e
    SHA512 1d164b3cb5b2453c3232aa12b5d739097ff3509d855dd41a4c56c354628c2da073ad7ec75b8da30112c97ac71cf329cca9339d0ec92f5f24afc4f4b99e636d79
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
