vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO njaldea/nil-xit-test
    REF a6b407579bb1bddee5c1b2bb70ccd4f80ad3c5c7
    SHA512 7fdbd62b224352ceb886729f1c5e6e86ed0d3ba0b802a84e88743c3c4a869379c715dc205be659798964f27a18c4ac846e2e870f7c13778ca7d1835d0b424fed
    HEAD_REF master
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        gtest          ENABLE_FEATURE_GTEST
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS ${FEATURE_OPTIONS}
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
