vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-clix
    REF 13339ea61cb8e80b3e6f36bdc47d7ff6485b08a7
    SHA512 d05c168f5f2fd52f3acf7a050faaf3141ee7cc92dc00459df19a3e37d5c0c803d3df4f178599ac38abd9d0cf2e2ff3b4af54ffc837166daddeab0596f7b264bc
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
