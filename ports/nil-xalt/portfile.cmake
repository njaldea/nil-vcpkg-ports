vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xalt
    REF a5f7e36af585374c5009453714759a4142b9b279
    SHA512 75c0afe3a46a3eeea3ba267297fe565b8a3c06e1f298c62dab2f8d9315dbffd98e34f0198d51f24ab4c2a523a77f6d36d8c089cde85afffab500fdc92e8cb445
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
