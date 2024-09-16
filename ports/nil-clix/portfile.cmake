vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-clix
    REF 0cc5b20e864eead2fcb9dc6be460aa0a94244c43
    SHA512 e0798e66ad99b00b61a6e81908daf35a03c6b7a1bdbe8db0adc1f710273c70c7174c3f94d9bd5116133c46ad7486eec086cca651098a35e436888eaa776421a1
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
