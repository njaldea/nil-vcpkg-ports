vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xalt
    REF 1285b2d237eeb4ec70ec52b754a42146088e6f71
    SHA512 56f7359d341075b93e3f5689f78ce715ddb5676a0214b3e8612e078c82033af739941d878c8a87dc0b1664658f39a99263e417b625cc9493c9335308b8c36f79
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
