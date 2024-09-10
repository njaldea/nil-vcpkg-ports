vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-gate
    REF ed2ef6a0caedf38c1c4ec33d1317e13d2892f5dc
    SHA512 d68cb24b173a5e81823988c0d33da7458f84fee2ec4120bb0df4b66a66bd0b8c9d53506993192281fc85027a434fbfd9ba2b00df303bbbce81fc7939a5ce608e
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
