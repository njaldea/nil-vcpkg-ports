vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF b61d6df37a4eb39c74112f501a09e6822652e7c3
    SHA512 b813dc6f3a38842815dd4cf7cc91d61d7493f42507b42e4bf4b5ebde7af53862a9a5b6bcae352c96bb42162091c5e1b489d64321647000cc8996788510256656
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
