vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-clix
    REF 30a5d0f03842bcb34ed408f1d009b541a7b78ff9
    SHA512 5e5bfe599ed51dd08c3d462eb17ffba43d084290ce3d59f7b178582cb4e928c618bb7767bec96d224513347cc86c04bc5654564402f32819bb9cebdb8f27d3dd
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
