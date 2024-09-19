vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF bee43823e58835066a8cf9e8eea5c1533ebb998f
    SHA512 62d775da2c1ada7cd17b74f480047e5dcb67552242f40264e2fbdfbfb482be1a14cba69917f8d8170c5feef245206a8240058c5c1bb08cdd496d16bb5436246c
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
