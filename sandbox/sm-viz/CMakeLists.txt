project(sandbox_sm_viz)

find_package(nil-sm CONFIG REQUIRED COMPONENTS viz)

add_executable(${PROJECT_NAME} main.cpp)
target_link_libraries(${PROJECT_NAME} PRIVATE nil::sm-viz)