vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF e1297934de2a6a3cbe6660f82d812501815559e6
    SHA512 d8de55b612f51c243a82dbe06d2181f146b6678cb0ad039914f5b04d7fd2685488d2dc2829583e7bc45366862e21cb1dedae22769122cc4684c7e5f66fadfa5e
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
