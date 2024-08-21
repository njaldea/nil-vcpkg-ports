vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF fba80c7da8bbddf04dde1d148af5d48c0cda38df
    SHA512 f63e08c9f7375c69c0bad2f21db4435ad0d7f4bd7b15444ca7fbbe90a598ae0e627e2192fd00d7e4c4fc4f469e762c5324f9de13905efb67fb7d3a1c0ab386f1
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
