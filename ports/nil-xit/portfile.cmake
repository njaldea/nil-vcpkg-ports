vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xit
    REF bb727b440156e8e37faf7aad21192b8bf1c3a860
    SHA512 f0edccabeebb31e77dcf7c495b86a7092b5a311cb232509d744790cfb3d7dbb4670979a5d7b16e7e6f371f8cb5acf2932de2efa2c6ea44c21077b9e65e36aa18
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
