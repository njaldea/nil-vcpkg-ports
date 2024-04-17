vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF 3b2bab5f5bad7a62af49b90b72883ac5c4203e16
    SHA512 3ca41fb4bb07d7a7af5852f9a6a1d6f83b23742048e542169669e8c3ace9a46fdde21cde9948617797c40d17013fd70477cafd5c88dd12103a95442be24ff303
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
