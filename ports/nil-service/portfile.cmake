vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF 01095efa531ba7e749fe1ff895be1cf1cf32a2db
    SHA512 df778718a1a55987a910fa5f14b16c46c442b7b53290c99e388a3a2c78a780cf24a11892787e1542c0f01bf44cec7e2ee27d7d7f2a68952766d21cb4242c5d0f
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
