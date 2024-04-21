vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-clix
    REF 5da5fe0d8d49e3ab4eed7bc93ae7cf7f81e328e8
    SHA512 21162a106324800d066df3db87bd760534df15ddc16aef841da26631b869b460d53f070a516e8612d79399198dfac2560b63e367fbb4d52ba435e0869b08e44a
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
