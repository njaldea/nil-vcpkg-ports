vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF f46e13c7f6e17c8016dff673d5c2b99724b78f00
    SHA512 f7baee8964bfb91e6c7d7510dfdc2c5b1da6973ea652f951ae4220a599cb8c0b2942b25e3e7cf3f23fe55ae6717fe96b0ba752309b571db944132d5e9cd6eac4
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
