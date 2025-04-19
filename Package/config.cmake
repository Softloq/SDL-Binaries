add_custom_target(
    SDL-DLL-Copy
    DEPENDS "${CMAKE_CURRENT_LIST_DIR}/__run_always"
    COMMENT "SDL DLL Copy"
    COMMAND ${CMAKE_COMMAND} -E copy_if_different "${CMAKE_CURRENT_LIST_DIR}/bin/SDL3.dll" "${CMAKE_BINARY_DIR}/$<CONFIG>/bin/SDL3.dll"
)
 
add_library(sdl-all INTERFACE)
add_dependencies(sdl-all SDL-DLL-Copy)
target_include_directories(sdl-all INTERFACE "${CMAKE_CURRENT_LIST_DIR}/include")
target_link_directories(sdl-all INTERFACE "${CMAKE_CURRENT_LIST_DIR}/lib")
target_link_libraries(sdl-all INTERFACE SDL3)
add_library(sdl::all ALIAS sdl-all)
