vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xit
    REF de209d65efd36e7cc524adc47c3a4dd5fa3a553c
    SHA512 cf152d04a71108e9292f32a5b1c0dfe09ac150042cf5467be54bf9c1347aa82c3d5a8fcbf8b50d41ba475a704b8ae027bda1c091d45fbf17f69301b672c69255
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
