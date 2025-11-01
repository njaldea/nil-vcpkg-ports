vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-clix
    REF v1.0.1
    SHA512 1451d49b5ecd0c91e5c34f6a71804a7bb82ec8640cf95b3f953b4bbebce28a327b42f07511eec4110da9964d3ebbe47098fd2d05bb13a53cc7388c334a06ae92
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
