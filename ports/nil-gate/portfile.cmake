vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-gate
    REF bc4f9611a8bfe6644abc8fbe87193c688ca6ec97
    SHA512 2a5177af341d4ed0b70328e3e4213ece6bdedb1245f26bd1f77cf161c36379bfd2bf23c1fd6961a6560cdfce33caa64899b96e73887f9a6c416898116fb56636
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
