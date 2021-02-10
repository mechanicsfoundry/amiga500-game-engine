cmake_minimum_required(VERSION 3.8)

set(PROJECT_NAME amiga-game)
set(PROJECT_data_NAME amiga-game-data)

set(CMAKE_C_COMPILER "/opt/amiga/bin/m68k-amigaos-gcc")
set(CMAKE_CXX_COMPILER "/opt/amiga/bin/m68k-amigaos-g++")

project(${PROJECT_NAME})

set(CMAKE_CXX_STANDARD 14)
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14 -stdlib=libc++")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -fbaserel")

set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})

set_property(GLOBAL PROPERTY USE_FOLDERS ON)

set(SOURCES
    "src/Engine.cpp")

set(HEADERS)

add_executable(
    ${PROJECT_NAME}
    ${SOURCES}
    ${HEADERS})

add_custom_target(
    ${PROJECT_data_NAME} ALL
    COMMENT "Copying Data..."
    COMMAND ${CMAKE_COMMAND} -E copy_directory
    ${CMAKE_CURRENT_SOURCE_DIR}/data/
    ${CMAKE_CURRENT_BINARY_DIR}/data)

add_dependencies(
    ${PROJECT_NAME}
    ${PROJECT_data_NAME})
