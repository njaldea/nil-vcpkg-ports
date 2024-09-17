vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-clix
    REF 238db41a006521f37b5d467f4f3b072cf566a2ce
    SHA512 978a7961d4a4366439deb86b79c658616280c3023332cb7ff72cb2e993527b236961dec37802f8efda069819a94bbc345d3d4bcd358bfa22f8db58bd06afae4a
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
