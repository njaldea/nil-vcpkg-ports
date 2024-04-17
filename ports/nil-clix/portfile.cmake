vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-clix
    REF 838a913fcf1484e59a4585d76aa34e91d6e916dd
    SHA512 e93dfa1cc2eee3da354427f5e6308496d03a3b13937db5d47efa85ae4099d299ce54e2a55c92db840fe1a92f555e33767eb1999f372ab1fc3a985d7fc45b6223
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
