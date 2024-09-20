vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-clix
    REF 1b613c705f3818fdfe1f6ad9305d591d47b59889
    SHA512 7170b7af2d3f0180dfa09107f256d32f2b1dba99f31b0b016bd8648901427666869d97da29c2b4989592b339bb1bf9fe80a7b6c24a8f49c9fa0f967a58e38511
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
