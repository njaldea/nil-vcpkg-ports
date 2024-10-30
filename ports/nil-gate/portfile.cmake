vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-gate
    REF 470aa56806162d05c319e64bf96616d1cf96e503
    SHA512 67e8bcb7fed652347c4095fb64cc05339a8a93717abd03600da81aa0fb12a786e4b9395b4d27906db7cbaf3272b525fa8e6d782d4723ca5f537f974d2c081e9a
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
