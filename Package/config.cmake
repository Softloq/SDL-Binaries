add_library(sdl-all INTERFACE)
target_include_directories(sdl-all INTERFACE "${CMAKE_CURRENT_LIST_DIR}/include")
target_link_directories(sdl-all INTERFACE "${CMAKE_CURRENT_LIST_DIR}/lib")
target_link_libraries(sdl-all INTERFACE SDL3)
add_library(sdl::all ALIAS sdl-all)

if(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    add_custom_target(
        Copy-SDL-DLL
        COMMENT "Copy SDL DLL"
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${CMAKE_CURRENT_LIST_DIR}/bin/SDL3.dll" "${CMAKE_BINARY_DIR}/$<CONFIG>/bin/SDL3.dll"
    )
    add_dependencies(sdl-all Copy-SDL-DLL)
endif()