vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-gate
    REF c6bf7c6ce42765686156d437c849c28ec37df28a
    SHA512 3316647217dcbdbdd94da0c2346df49383b7c5a2791d7b5b1980b0920e265a457215fb3fec4bb70507a37b2e48937606f8c3f026546d69596e3a2a531db51b6c
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")

file(
    INSTALL "${SOURCE_PATH}/LICENSE"
    DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
    RENAME copyright
)