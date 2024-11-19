vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-clix
    REF d5dfa27e86316bea99fe40aeb9340085c414c9f3
    SHA512 d34338d0057d83d1e33709f8811383cc591c9a27781975b55f0139f9f2e0e902e4e4470c06672622e78b74a1ca4e2fe078aa8ef58d0c53008392e8930234b854
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
