vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xit
    REF e10023ec8a73a828cb824d2ea7350f1ab0e3b14c
    SHA512 8c72b160b56cae74affc0f07dbc6735e7ef7f05e409b97dd1a2a6ef3a9b98d87089b53e0e848e6eb6ce263d480aafe7d6fa6078dcc7e60dfbd6ff1f6f6ba22d2
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
