vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-gate
    REF v1.3.0
    SHA512 d7e25e7b49db1c80a18036d73d34274cb66725d89b1133280ced4ba11ab1cff000f78aa1dc9eeb6d5287259a2fd8198fb7f6f960e7cd4914a24ab9041616e7b6
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
