vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil_gate
    REF c16836a1cfc9b8c9dfcb93a80f58a5f0957db9d6
    SHA512 be642912083f89ed634c5cde2d500c2cc8f97c6f7e32d9ec2bb96e0546928639912e6b5e41f65c555943da5e38d19d1a6700d0a9ed995176be831250a70c5dfb
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
    INSTALL "${SOURCE_PATH}/LICENSE"
    DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
    RENAME copyright
)