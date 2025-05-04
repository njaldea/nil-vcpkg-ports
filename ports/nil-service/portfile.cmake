vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF 2a2bbffdc82fd91f3b0397c4a54f8aa0a7e3c317
    SHA512 d2504e38065af8a8982b58d9fee276a640d2513f6fae6ca8b577a217b2329ab42f6300733234df5dc05002eb37a5c32c26d2b117f2f736fc86994140d1c49891
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
