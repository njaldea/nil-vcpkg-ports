vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF 8523b92b7fb35876b28f1a8c74a82f30cee88163
    SHA512 37bbcf061849cb880754a7368aa893d9368de81d901c8f9ead97a257d8baed748f15881c711931c053a0f04bd7d7719d589409f54838dafaf464be0213523149
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
