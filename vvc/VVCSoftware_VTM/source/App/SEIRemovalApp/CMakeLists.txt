# executable
set( EXE_NAME SEIRemovalApp )

# get source files
file( GLOB SRC_FILES "*.cpp" )

# get include files
file( GLOB INC_FILES "*.h" )

# get additional libs for gcc on Ubuntu systems
if( CMAKE_SYSTEM_NAME STREQUAL "Linux" )
  if( CMAKE_CXX_COMPILER_ID STREQUAL "GNU" )
    if( USE_ADDRESS_SANITIZER )
      set( ADDITIONAL_LIBS asan )
    endif()
  endif()
endif()

# NATVIS files for Visual Studio
if( MSVC )
  file( GLOB NATVIS_FILES "../../VisualStudio/*.natvis" )
endif()

# add executable
add_executable( ${EXE_NAME} ${SRC_FILES} ${INC_FILES} ${NATVIS_FILES} )
include_directories(${CMAKE_CURRENT_BINARY_DIR})

if( SET_ENABLE_TRACING )
  if( ENABLE_TRACING )
    target_compile_definitions( ${EXE_NAME} PUBLIC ENABLE_TRACING=1 )
  else()
    target_compile_definitions( ${EXE_NAME} PUBLIC ENABLE_TRACING=0 )
  endif()
endif()

if( CMAKE_COMPILER_IS_GNUCC AND BUILD_STATIC )
  set( ADDITIONAL_LIBS ${ADDITIONAL_LIBS} -static -static-libgcc -static-libstdc++ )
  target_compile_definitions( ${EXE_NAME} PUBLIC ENABLE_WPP_STATIC_LINK=1 )
endif()

target_link_libraries( ${EXE_NAME} CommonLib DecoderLib Utilities ${ADDITIONAL_LIBS} )

# lldb custom data formatters
if( XCODE )
  add_dependencies( ${EXE_NAME} Install${PROJECT_NAME}LldbFiles )
endif()

if( CMAKE_SYSTEM_NAME STREQUAL "Linux" )
  add_custom_command( TARGET ${EXE_NAME} POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy
                                                          $<$<CONFIG:Debug>:${CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG}/SEIRemovalApp>
                                                          $<$<CONFIG:Release>:${CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE}/SEIRemovalApp>
                                                          $<$<CONFIG:RelWithDebInfo>:${CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELWITHDEBINFO}/SEIRemovalApp>
                                                          $<$<CONFIG:MinSizeRel>:${CMAKE_RUNTIME_OUTPUT_DIRECTORY_MINSIZEREL}/SEIRemovalApp>
                                                          $<$<CONFIG:Debug>:${CMAKE_SOURCE_DIR}/bin/SEIRemovalAppStaticd>
                                                          $<$<CONFIG:Release>:${CMAKE_SOURCE_DIR}/bin/SEIRemovalAppStatic>
                                                          $<$<CONFIG:RelWithDebInfo>:${CMAKE_SOURCE_DIR}/bin/SEIRemovalAppStaticp>
                                                          $<$<CONFIG:MinSizeRel>:${CMAKE_SOURCE_DIR}/bin/SEIRemovalAppStaticm> )
endif()

# example: place header files in different folders
source_group( "Natvis Files" FILES ${NATVIS_FILES} )

# set the folder where to place the projects
set_target_properties( ${EXE_NAME}         PROPERTIES FOLDER app LINKER_LANGUAGE CXX )
