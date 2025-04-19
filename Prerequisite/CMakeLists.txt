cmake_minimum_required(VERSION 3.10)

project(SDL-Prerequisite)

# Download SDL
if(NOT EXISTS "${CMAKE_BINARY_DIR}/Downloads/sdl-${SDL_VERSION}.zip")
    file(DOWNLOAD "https://github.com/libsdl-org/SDL/archive/refs/tags/release-${SDL_VERSION}.zip" "${CMAKE_BINARY_DIR}/Downloads/sdl-${SDL_VERSION}.zip" SHOW_PROGRESS)
endif()
if(NOT EXISTS "${CMAKE_BINARY_DIR}/Downloads/SDL-release-${SDL_VERSION}")
    file(ARCHIVE_EXTRACT INPUT "${CMAKE_BINARY_DIR}/Downloads/sdl-${SDL_VERSION}.zip" DESTINATION "${CMAKE_BINARY_DIR}/Downloads")
endif()
