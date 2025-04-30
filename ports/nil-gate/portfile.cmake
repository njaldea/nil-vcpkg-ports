vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-gate
    REF dd6f4db120011b2c7f336efa82304ae41e4afb4c
    SHA512 13837ffed9416ccefc84c5885885bf5fca38e230f5e594b23430ea0346d75bb37b2fe6bd6262be1715c49e3891f97c5a4d8c51df3671a645322c56119ff88d49
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
