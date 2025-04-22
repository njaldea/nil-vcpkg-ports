vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xalt
    REF 3ae39b817a186081b4952c995674decbcd62a829
    SHA512 edd7b5bcd4aa4aa08fac46664e95956a69dc213c458ea3f1aa81f9fd1980a5acbcfcb2a06c217a4eba04bcc56d8fbe867e63dcd1598f1f73f4815cb1cb8dd2f6
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
