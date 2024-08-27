vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF c46c4d1480030700c174f7065300f53ce164715c
    SHA512 ca87d6e48cd6c6ee8fd976daac17ed5eeb213a7dbfa54b0015ad5e5292073066ab449bb07ecaae869df0864bde5c77333ddfbd23073fd1bc2b85e1aaa0ce45c0
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
