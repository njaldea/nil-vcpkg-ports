include(CMakePackageConfigHelpers)

set(VCPKG_POLICY_EMPTY_PACKAGE enabled)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        gate           ENABLE_FEATURE_GATE
        clix           ENABLE_FEATURE_CLIX
        service        ENABLE_FEATURE_SERVICE
        xalt           ENABLE_FEATURE_XALT
        xit            ENABLE_FEATURE_XIT
        xit-test       ENABLE_FEATURE_XIT_TEST
)

if(NOT FEATURE_OPTIONS MATCHES "^.*=ON.*$")
    string(ASCII 27 Esc)
    set(Red         "${Esc}[1;31m")
    set(ColorReset  "${Esc}[m")
    message(
        "\nAvailable features:"
        "\n   -  gate"
        "\n   -  clix"
        "\n   -  service"
        "\n   -  xalt"
        "\n   -  xit"
        "\n   -  xit-test"
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

set(USAGE_FILE ${CURRENT_PACKAGES_DIR}/share/${PORT}/usage)
file(WRITE  ${USAGE_FILE} "nil provides CMake targets:\n\n")
file(APPEND ${USAGE_FILE} "    # depending on nil package via features\n")
file(APPEND ${USAGE_FILE} "    find_package(nil COMPONENTS [FEATURE...] CONFIG REQUIRED)\n\n")
file(APPEND ${USAGE_FILE} "    # or depending on individual packages\n")
file(APPEND ${USAGE_FILE} "    find_package(nil-[FEATURE] CONFIG REQUIRED)\n\n")
file(APPEND ${USAGE_FILE} "    # link your target\n")
file(APPEND ${USAGE_FILE} "    target_link_libraries(TARGET PUBLIC nil::[FEATURE])\n\n")
file(APPEND ${USAGE_FILE} "Available Features:\n")
if(${ENABLE_FEATURE_GATE})
    file(APPEND ${USAGE_FILE} "    gate\n")
endif()
if(${ENABLE_FEATURE_CLIX})
    file(APPEND ${USAGE_FILE} "    clix\n")
endif()
if(${ENABLE_FEATURE_SERVICE})
    file(APPEND ${USAGE_FILE} "    service\n")
endif()
if(${ENABLE_FEATURE_XALT})
    file(APPEND ${USAGE_FILE} "    xalt\n")
endif()
if(${ENABLE_FEATURE_XIT})
    file(APPEND ${USAGE_FILE} "    xit\n")
endif()
if(${ENABLE_FEATURE_XIT_TEST})
    file(APPEND ${USAGE_FILE} "    xit-test\n")
endif()