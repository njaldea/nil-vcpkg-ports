vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF d25e5e9c92b34d1b7af2377e39b8d0b659681d03
    SHA512 9abfe691c0901a7840e8f15a87a0e00cc155330bf418b08daca89ee9ea699c2f6cfd3fcbafc89d7846bd17d131346277655ce5dec4406d76b363f8fa538c292f
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
