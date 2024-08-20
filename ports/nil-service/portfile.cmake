vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF c2e7e72aafbde04b5f17451c4829caa89861fe09
    SHA512 ecfd7d5c562651f015def962348bf21c880b35bf7a5fad5d1ec6296761883de08704bb71c71e5a401604d35062f99d7389761733b251f3e29e1fc83028b66708
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
