vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF 783f5d9bc6162274a4c69da71b8a0d779089b44b
    SHA512 8be25231cfd4469815834133746e047a85ebf886c70f1d0947f3db5a0ff5e59879e2f58c8e288cfe92f604973c6ab0510e6edc933b9e33ee24d97cb09e2f969a
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
