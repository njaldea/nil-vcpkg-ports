vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xalt
    REF v1.0.0
    SHA512 3b6de1ceb908c043885f3223ca880e2a6b1baf17d03e503a0beca90f7e65106167b4b4364224ca44fbe2d8a9f7650673df147b1e4e8ef615947acb122b7fe24f
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
