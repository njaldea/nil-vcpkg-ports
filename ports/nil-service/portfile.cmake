vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF 891d5bb434ecfe20bbfff530a80fa0f45ee950d2
    SHA512 4ad44efb1cbcc61addd34cae3ef7b6138fdfcf51a40edb8f33e7ccea3de3116e9825c172b0c85c3d36f08c0265f6756cd15c3d2821b73c8cd05e34b59ee8e4a1
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
