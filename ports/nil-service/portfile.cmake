vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF 6bf9bfb687d42fba7bf32544e86546675b0e69b6
    SHA512 98927f0d2d79a4164321576a22e60f24b16d0c78b98c47f9d88b65f66fa9043998f1e1001c598422f593d36c083d3a6221a8aeacfc0a3464c18bc4e9d629cca8
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
