vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF d597928e19f80b5867e6fe9336e7bcb2d97cd871
    SHA512 63f064d6defb2af76a1c8141e38a98cdc44ea0a98e72a3f907d03d47f11704a0ef54ce7e2f823fa701a4a0a84a45333b5061cac754e64690461ee0e404f2369d
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
