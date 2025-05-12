vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-clix
    REF v1.0.0
    SHA512 dc62b40d3b9c08ec51eed17b53a71b609f030f344a1496657b770f04cc5572341a82d8a3c0cd80052eab60a8029817e7f4254b432d08f86719295870042e16ba
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
