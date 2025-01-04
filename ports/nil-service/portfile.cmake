vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF 0ec3d243e961166775695358f7da7656dbd917be
    SHA512 3f0ea96e27a94f065c4f8360e7bac721958c1b2a7d24b8cb8587d923185bb01ca510b1b9e603d25acbc9195a7b8d14fe9849b49cc7b0b8a1e3e7d640b8c6c8d8
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
