vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF e2cc3e80c040588801c29dc63999c68c40043d8c
    SHA512 3a9979fe3f6b6db5b65529dfc6c907ece930972adbefe80e4e6043cba08909be3e1c4a8546c6656e1c789119d9b04547ae322ecc4ae9d6568e4c44f9ebc68f35
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
