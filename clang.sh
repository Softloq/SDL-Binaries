#!/bin/bash

(
    source .env
    SCRIPT_DIR=$(readlink -f $(dirname "$0"))
    
    cmake -S $SCRIPT_DIR/Prerequisite -B $SCRIPT_DIR/build/Prerequisite -DSDL_VERSION="$SDL_VERSION"
    cmake --build $SCRIPT_DIR/build/Prerequisite

    cmake -S $SCRIPT_DIR/build/Prerequisite/Downloads/SDL-release-$SDL_VERSION -B $SCRIPT_DIR/build/Compile -DSDL_VERSION="$SDL_VERSION" -G"Unix Makefiles" -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$SCRIPT_DIR/build/Package/sdl-$SDL_VERSION/sdl" -DSDL_STATIC=OFF -DSDL_SHARED=ON -DCMAKE_CXX_STANDARD=23 -DCMAKE_CXX_STANDARD_REQUIRED=TRUE -DCMAKE_CXX_EXTENSIONS=OFF -DCMAKE_CXX_FLAGS_RELEASE="/MD" -DBUILD_SHARED_LIBS=ON
    cmake --build $SCRIPT_DIR/build/Compile --config Release --target install -j$(nproc)

    cmake -S $SCRIPT_DIR/Package -B $SCRIPT_DIR/build/Package -DSDL_VERSION="$SDL_VERSION" -DPACKAGE_NAME="sdl-linux-clang.zip"
    cmake --build $SCRIPT_DIR/build/Package
)
