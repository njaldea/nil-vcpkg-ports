cmake_minimum_required(VERSION 3.27.1)

project(
    nil-vcpkg-ports
    VERSION 0.0.1
    LANGUAGES CXX
    DESCRIPTION "vcpkg ports for nil libraries"
)

find_package(nil-cmake CONFIG REQUIRED)
add_subdirectory(sandbox/all)
add_subdirectory(sandbox/sm-viz)