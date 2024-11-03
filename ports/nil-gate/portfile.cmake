vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-gate
    REF 1ca9c29b55da6623e712b9aa9b054017eb2d3759
    SHA512 561c2c2cb2f5a52828c2a6efe82b127bbf70242259a799134a47545ffb0bf882cc6e589deddbc8ecaee228289557664849631da10a334822fb77885801ecfa90
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
