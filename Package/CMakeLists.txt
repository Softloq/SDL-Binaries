cmake_minimum_required(VERSION 3.10)

project(SDL-Package)

# Package sdl.zip
configure_file("${CMAKE_CURRENT_LIST_DIR}/sdl.cmake" "${CMAKE_BINARY_DIR}/sdl-$ENV{SDL_VERSION}/sdl/sdl.cmake" COPYONLY)
configure_file("${CMAKE_CURRENT_LIST_DIR}/copy_dll.cmake" "${CMAKE_BINARY_DIR}/sdl-$ENV{SDL_VERSION}/sdl/copy_dll.cmake" COPYONLY)
add_custom_target(zip_sdl ALL
    COMMAND ${CMAKE_COMMAND} -E tar cfv "${CMAKE_BINARY_DIR}/sdl.zip" --format=zip .
    WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/sdl-$ENV{SDL_VERSION}/sdl")
