vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xalt
    REF aa4195d694b309de259feacd45fcc55c2ce29dab
    SHA512 d9de382b95c577b45613a1f32089da9bbdd5f314ecdedf0130be00752452caafb8e166e86e7574027df807d7a653bd8ed5ae611bb5fec6874096d9889645aad5
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
