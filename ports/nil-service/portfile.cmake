vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-service
    REF e3f7c2881a717785d58ea6963067090e83011701
    SHA512 d02852e60c60776212beebc47799a3905d14ec8616a8aef5930023c81ceb39e2a24aaa33cf2a3fa86dea2a8685d56167a2643e7c0921814036e5fcf018c33e10
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
