vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xalt
    REF v1.3.0
    SHA512 018ed80432511d24309692fb4b65d406b373080047d11a4a91bc2663cf89cd8a98d7876f43b056d3164dcb8c70f7d0822b81ff62db3572a3f482d2b4034adc77
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
