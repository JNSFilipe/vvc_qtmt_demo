# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /nfs/home/jfilipe.it/.local/lib/python3.8/site-packages/cmake/data/bin/cmake

# The command to remove a file.
RM = /nfs/home/jfilipe.it/.local/lib/python3.8/site-packages/cmake/data/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /tmp/VVCSoftware_VTM

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /tmp/VVCSoftware_VTM/build

# Include any dependencies generated for this target.
include source/App/SEIRemovalApp/CMakeFiles/SEIRemovalApp.dir/depend.make

# Include the progress variables for this target.
include source/App/SEIRemovalApp/CMakeFiles/SEIRemovalApp.dir/progress.make

# Include the compile flags for this target's objects.
include source/App/SEIRemovalApp/CMakeFiles/SEIRemovalApp.dir/flags.make

source/App/SEIRemovalApp/CMakeFiles/SEIRemovalApp.dir/SEIRemovalApp.cpp.o: source/App/SEIRemovalApp/CMakeFiles/SEIRemovalApp.dir/flags.make
source/App/SEIRemovalApp/CMakeFiles/SEIRemovalApp.dir/SEIRemovalApp.cpp.o: ../source/App/SEIRemovalApp/SEIRemovalApp.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/VVCSoftware_VTM/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object source/App/SEIRemovalApp/CMakeFiles/SEIRemovalApp.dir/SEIRemovalApp.cpp.o"
	cd /tmp/VVCSoftware_VTM/build/source/App/SEIRemovalApp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/SEIRemovalApp.dir/SEIRemovalApp.cpp.o -c /tmp/VVCSoftware_VTM/source/App/SEIRemovalApp/SEIRemovalApp.cpp

source/App/SEIRemovalApp/CMakeFiles/SEIRemovalApp.dir/SEIRemovalApp.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SEIRemovalApp.dir/SEIRemovalApp.cpp.i"
	cd /tmp/VVCSoftware_VTM/build/source/App/SEIRemovalApp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /tmp/VVCSoftware_VTM/source/App/SEIRemovalApp/SEIRemovalApp.cpp > CMakeFiles/SEIRemovalApp.dir/SEIRemovalApp.cpp.i

source/App/SEIRemovalApp/CMakeFiles/SEIRemovalApp.dir/SEIRemovalApp.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SEIRemovalApp.dir/SEIRemovalApp.cpp.s"
	cd /tmp/VVCSoftware_VTM/build/source/App/SEIRemovalApp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /tmp/VVCSoftware_VTM/source/App/SEIRemovalApp/SEIRemovalApp.cpp -o CMakeFiles/SEIRemovalApp.dir/SEIRemovalApp.cpp.s

source/App/SEIRemovalApp/CMakeFiles/SEIRemovalApp.dir/SEIRemovalAppCfg.cpp.o: source/App/SEIRemovalApp/CMakeFiles/SEIRemovalApp.dir/flags.make
source/App/SEIRemovalApp/CMakeFiles/SEIRemovalApp.dir/SEIRemovalAppCfg.cpp.o: ../source/App/SEIRemovalApp/SEIRemovalAppCfg.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/VVCSoftware_VTM/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object source/App/SEIRemovalApp/CMakeFiles/SEIRemovalApp.dir/SEIRemovalAppCfg.cpp.o"
	cd /tmp/VVCSoftware_VTM/build/source/App/SEIRemovalApp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/SEIRemovalApp.dir/SEIRemovalAppCfg.cpp.o -c /tmp/VVCSoftware_VTM/source/App/SEIRemovalApp/SEIRemovalAppCfg.cpp

source/App/SEIRemovalApp/CMakeFiles/SEIRemovalApp.dir/SEIRemovalAppCfg.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SEIRemovalApp.dir/SEIRemovalAppCfg.cpp.i"
	cd /tmp/VVCSoftware_VTM/build/source/App/SEIRemovalApp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /tmp/VVCSoftware_VTM/source/App/SEIRemovalApp/SEIRemovalAppCfg.cpp > CMakeFiles/SEIRemovalApp.dir/SEIRemovalAppCfg.cpp.i

source/App/SEIRemovalApp/CMakeFiles/SEIRemovalApp.dir/SEIRemovalAppCfg.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SEIRemovalApp.dir/SEIRemovalAppCfg.cpp.s"
	cd /tmp/VVCSoftware_VTM/build/source/App/SEIRemovalApp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /tmp/VVCSoftware_VTM/source/App/SEIRemovalApp/SEIRemovalAppCfg.cpp -o CMakeFiles/SEIRemovalApp.dir/SEIRemovalAppCfg.cpp.s

source/App/SEIRemovalApp/CMakeFiles/SEIRemovalApp.dir/seiremovalmain.cpp.o: source/App/SEIRemovalApp/CMakeFiles/SEIRemovalApp.dir/flags.make
source/App/SEIRemovalApp/CMakeFiles/SEIRemovalApp.dir/seiremovalmain.cpp.o: ../source/App/SEIRemovalApp/seiremovalmain.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/VVCSoftware_VTM/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object source/App/SEIRemovalApp/CMakeFiles/SEIRemovalApp.dir/seiremovalmain.cpp.o"
	cd /tmp/VVCSoftware_VTM/build/source/App/SEIRemovalApp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/SEIRemovalApp.dir/seiremovalmain.cpp.o -c /tmp/VVCSoftware_VTM/source/App/SEIRemovalApp/seiremovalmain.cpp

source/App/SEIRemovalApp/CMakeFiles/SEIRemovalApp.dir/seiremovalmain.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SEIRemovalApp.dir/seiremovalmain.cpp.i"
	cd /tmp/VVCSoftware_VTM/build/source/App/SEIRemovalApp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /tmp/VVCSoftware_VTM/source/App/SEIRemovalApp/seiremovalmain.cpp > CMakeFiles/SEIRemovalApp.dir/seiremovalmain.cpp.i

source/App/SEIRemovalApp/CMakeFiles/SEIRemovalApp.dir/seiremovalmain.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SEIRemovalApp.dir/seiremovalmain.cpp.s"
	cd /tmp/VVCSoftware_VTM/build/source/App/SEIRemovalApp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /tmp/VVCSoftware_VTM/source/App/SEIRemovalApp/seiremovalmain.cpp -o CMakeFiles/SEIRemovalApp.dir/seiremovalmain.cpp.s

# Object files for target SEIRemovalApp
SEIRemovalApp_OBJECTS = \
"CMakeFiles/SEIRemovalApp.dir/SEIRemovalApp.cpp.o" \
"CMakeFiles/SEIRemovalApp.dir/SEIRemovalAppCfg.cpp.o" \
"CMakeFiles/SEIRemovalApp.dir/seiremovalmain.cpp.o"

# External object files for target SEIRemovalApp
SEIRemovalApp_EXTERNAL_OBJECTS =

../bin/umake/gcc-9.4/x86_64/release/SEIRemovalApp: source/App/SEIRemovalApp/CMakeFiles/SEIRemovalApp.dir/SEIRemovalApp.cpp.o
../bin/umake/gcc-9.4/x86_64/release/SEIRemovalApp: source/App/SEIRemovalApp/CMakeFiles/SEIRemovalApp.dir/SEIRemovalAppCfg.cpp.o
../bin/umake/gcc-9.4/x86_64/release/SEIRemovalApp: source/App/SEIRemovalApp/CMakeFiles/SEIRemovalApp.dir/seiremovalmain.cpp.o
../bin/umake/gcc-9.4/x86_64/release/SEIRemovalApp: source/App/SEIRemovalApp/CMakeFiles/SEIRemovalApp.dir/build.make
../bin/umake/gcc-9.4/x86_64/release/SEIRemovalApp: ../lib/umake/gcc-9.4/x86_64/release/libCommonLib.a
../bin/umake/gcc-9.4/x86_64/release/SEIRemovalApp: ../lib/umake/gcc-9.4/x86_64/release/libDecoderLib.a
../bin/umake/gcc-9.4/x86_64/release/SEIRemovalApp: ../lib/umake/gcc-9.4/x86_64/release/libUtilities.a
../bin/umake/gcc-9.4/x86_64/release/SEIRemovalApp: ../lib/umake/gcc-9.4/x86_64/release/libCommonLib.a
../bin/umake/gcc-9.4/x86_64/release/SEIRemovalApp: source/App/SEIRemovalApp/CMakeFiles/SEIRemovalApp.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/tmp/VVCSoftware_VTM/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable ../../../../bin/umake/gcc-9.4/x86_64/release/SEIRemovalApp"
	cd /tmp/VVCSoftware_VTM/build/source/App/SEIRemovalApp && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/SEIRemovalApp.dir/link.txt --verbose=$(VERBOSE)
	cd /tmp/VVCSoftware_VTM/build/source/App/SEIRemovalApp && /nfs/home/jfilipe.it/.local/lib/python3.8/site-packages/cmake/data/bin/cmake -E copy  /tmp/VVCSoftware_VTM/bin/umake/gcc-9.4/x86_64/release/SEIRemovalApp    /tmp/VVCSoftware_VTM/bin/SEIRemovalAppStatic  

# Rule to build all files generated by this target.
source/App/SEIRemovalApp/CMakeFiles/SEIRemovalApp.dir/build: ../bin/umake/gcc-9.4/x86_64/release/SEIRemovalApp

.PHONY : source/App/SEIRemovalApp/CMakeFiles/SEIRemovalApp.dir/build

source/App/SEIRemovalApp/CMakeFiles/SEIRemovalApp.dir/clean:
	cd /tmp/VVCSoftware_VTM/build/source/App/SEIRemovalApp && $(CMAKE_COMMAND) -P CMakeFiles/SEIRemovalApp.dir/cmake_clean.cmake
.PHONY : source/App/SEIRemovalApp/CMakeFiles/SEIRemovalApp.dir/clean

source/App/SEIRemovalApp/CMakeFiles/SEIRemovalApp.dir/depend:
	cd /tmp/VVCSoftware_VTM/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /tmp/VVCSoftware_VTM /tmp/VVCSoftware_VTM/source/App/SEIRemovalApp /tmp/VVCSoftware_VTM/build /tmp/VVCSoftware_VTM/build/source/App/SEIRemovalApp /tmp/VVCSoftware_VTM/build/source/App/SEIRemovalApp/CMakeFiles/SEIRemovalApp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : source/App/SEIRemovalApp/CMakeFiles/SEIRemovalApp.dir/depend

