vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xit
    REF 8071cc79cb56a80d72d3988edf802bd787dd3007
    SHA512 29d080a2edbddccb5e554f5b895b73e87d1f27ebc625abbe17810fcb69e7c1908c757a3096b119c89ca018787693ac96421586b313954d2c828f8eea50e706ef
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
