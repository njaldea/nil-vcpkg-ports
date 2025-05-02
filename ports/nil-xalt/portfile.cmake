vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xalt
    REF 80a540a050bc39159b4e69fb1e52c325937170fb
    SHA512 5677c0fa661ce9db8a2db556c24a996fe85d1f41bdc2fb9427261103134ef71f9584bb82b5c9a34077ba2ed6b1f23bb683efaaa29bf13c3521fc5df6032de457
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
