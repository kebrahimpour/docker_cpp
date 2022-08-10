cmake_minimum_required(VERSION 3.5)

# Set the project name
project (hello_cmake LANGUAGES CXX)

# Add an executable
add_executable(hello_cmake src/main.cpp)

target_compile_features(${PROJECT_NAME} PRIVATE cxx_std_17)
set_target_properties(${PROJECT_NAME} PRIVATE -Wall
                                              -Wbuiltin-macro-redefined
                                              -pedantic
                                              -Werror
)
set (CMAKE_EXPORT_COMPILE_COMMANS ON)                                              
set (Boost_USE_STATIC_Libs ON)
set (Boost_USE_MULTITHREADED ON)
set (Boost_USE_STATIC_RUNTIME ON)

find_package(Boost REQUIRED COMPONENTS filesystem)

target_link_libraries(${PROJECT_NAME} Boost::filesystem)