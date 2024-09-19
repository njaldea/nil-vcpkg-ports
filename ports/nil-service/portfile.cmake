vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF c24f5b22e02aaf5ac618ef98fed54e188da62693
    SHA512 1b8bfdce75ea3fc3a7fb6a779cb55d5d9524ebbebc3cf0635e8f792edac522e427d0293ebb8c6d4a43ae9ba8b1adc4701ebe74ebb8d85bee8dc9090b5c9b265e
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
