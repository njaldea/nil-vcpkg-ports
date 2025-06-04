vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xit
    REF 228d744a298fc4db5bc34b829ff3e7e2e49a0bd0
    SHA512 6dd9c17dbf63e6cf5987b8719feae2188dad2151f223a5a8cb9b077f54940fb2db1bad6185fbc1a0850b51ef5ec7f8f1de6ff95b52c4ca96c71ae430ed8a1dfb
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
