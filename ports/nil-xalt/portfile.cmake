vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xalt
    REF v1.2.0
    SHA512 cccdbb554eb355b173079a0badecda30526ea2a1c2b2925da67a04c53697f950fc70f04f965ed61f27a051f9cd1a1f521eadbae473f79b5640d6070ada05f5f2
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
