include(CMakePackageConfigHelpers)

set(VCPKG_POLICY_EMPTY_PACKAGE enabled)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        gate           ENABLE_FEATURE_GATE
)

if(NOT FEATURE_OPTIONS MATCHES "^.*=ON.*$")
    string(ASCII 27 Esc)
    set(Red         "${Esc}[1;31m")
    set(ColorReset  "${Esc}[m")
    message(
        "\nAvailable features:"
        "\n   -  gate"
        "\n"
        "\n  ${Red}No feature provided. Terminating...${ColorReset}"
        "\n"
    )
    message(FATAL_ERROR "${Red}Specify at least one feature to enable${ColorReset}\n")
endif()

configure_package_config_file(
	${CMAKE_CURRENT_LIST_DIR}/config.cmake.in
	${CURRENT_PACKAGES_DIR}/share/${PORT}/nil-config.cmake
	INSTALL_DESTINATION ${CURRENT_PACKAGES_DIR}
	NO_SET_AND_CHECK_MACRO
)
    
write_basic_package_version_file(
	${CURRENT_PACKAGES_DIR}/share/${PORT}/nil-config-version.cmake
	VERSION 0.0.1
	COMPATIBILITY SameMajorVersion
)

vcpkg_install_copyright(FILE_LIST "${CMAKE_CURRENT_LIST_DIR}/LICENSE")