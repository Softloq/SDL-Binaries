add_custom_target(
    Copy_SDL_DLLs
    COMMENT "Copying SDL DLLs"
    COMMAND ${CMAKE_COMMAND}
        -DCopyPath="${CMAKE_BINARY_DIR}/$<CONFIG>/bin"
        -P "${CMAKE_CURRENT_LIST_DIR}/copy_dll.cmake")