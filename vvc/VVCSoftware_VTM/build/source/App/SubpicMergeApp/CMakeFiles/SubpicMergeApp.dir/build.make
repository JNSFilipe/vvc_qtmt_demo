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
include source/App/SubpicMergeApp/CMakeFiles/SubpicMergeApp.dir/depend.make

# Include the progress variables for this target.
include source/App/SubpicMergeApp/CMakeFiles/SubpicMergeApp.dir/progress.make

# Include the compile flags for this target's objects.
include source/App/SubpicMergeApp/CMakeFiles/SubpicMergeApp.dir/flags.make

source/App/SubpicMergeApp/CMakeFiles/SubpicMergeApp.dir/SubpicMergeApp.cpp.o: source/App/SubpicMergeApp/CMakeFiles/SubpicMergeApp.dir/flags.make
source/App/SubpicMergeApp/CMakeFiles/SubpicMergeApp.dir/SubpicMergeApp.cpp.o: ../source/App/SubpicMergeApp/SubpicMergeApp.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/VVCSoftware_VTM/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object source/App/SubpicMergeApp/CMakeFiles/SubpicMergeApp.dir/SubpicMergeApp.cpp.o"
	cd /tmp/VVCSoftware_VTM/build/source/App/SubpicMergeApp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/SubpicMergeApp.dir/SubpicMergeApp.cpp.o -c /tmp/VVCSoftware_VTM/source/App/SubpicMergeApp/SubpicMergeApp.cpp

source/App/SubpicMergeApp/CMakeFiles/SubpicMergeApp.dir/SubpicMergeApp.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SubpicMergeApp.dir/SubpicMergeApp.cpp.i"
	cd /tmp/VVCSoftware_VTM/build/source/App/SubpicMergeApp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /tmp/VVCSoftware_VTM/source/App/SubpicMergeApp/SubpicMergeApp.cpp > CMakeFiles/SubpicMergeApp.dir/SubpicMergeApp.cpp.i

source/App/SubpicMergeApp/CMakeFiles/SubpicMergeApp.dir/SubpicMergeApp.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SubpicMergeApp.dir/SubpicMergeApp.cpp.s"
	cd /tmp/VVCSoftware_VTM/build/source/App/SubpicMergeApp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /tmp/VVCSoftware_VTM/source/App/SubpicMergeApp/SubpicMergeApp.cpp -o CMakeFiles/SubpicMergeApp.dir/SubpicMergeApp.cpp.s

source/App/SubpicMergeApp/CMakeFiles/SubpicMergeApp.dir/SubpicMergeMain.cpp.o: source/App/SubpicMergeApp/CMakeFiles/SubpicMergeApp.dir/flags.make
source/App/SubpicMergeApp/CMakeFiles/SubpicMergeApp.dir/SubpicMergeMain.cpp.o: ../source/App/SubpicMergeApp/SubpicMergeMain.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/VVCSoftware_VTM/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object source/App/SubpicMergeApp/CMakeFiles/SubpicMergeApp.dir/SubpicMergeMain.cpp.o"
	cd /tmp/VVCSoftware_VTM/build/source/App/SubpicMergeApp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/SubpicMergeApp.dir/SubpicMergeMain.cpp.o -c /tmp/VVCSoftware_VTM/source/App/SubpicMergeApp/SubpicMergeMain.cpp

source/App/SubpicMergeApp/CMakeFiles/SubpicMergeApp.dir/SubpicMergeMain.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SubpicMergeApp.dir/SubpicMergeMain.cpp.i"
	cd /tmp/VVCSoftware_VTM/build/source/App/SubpicMergeApp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /tmp/VVCSoftware_VTM/source/App/SubpicMergeApp/SubpicMergeMain.cpp > CMakeFiles/SubpicMergeApp.dir/SubpicMergeMain.cpp.i

source/App/SubpicMergeApp/CMakeFiles/SubpicMergeApp.dir/SubpicMergeMain.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SubpicMergeApp.dir/SubpicMergeMain.cpp.s"
	cd /tmp/VVCSoftware_VTM/build/source/App/SubpicMergeApp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /tmp/VVCSoftware_VTM/source/App/SubpicMergeApp/SubpicMergeMain.cpp -o CMakeFiles/SubpicMergeApp.dir/SubpicMergeMain.cpp.s

# Object files for target SubpicMergeApp
SubpicMergeApp_OBJECTS = \
"CMakeFiles/SubpicMergeApp.dir/SubpicMergeApp.cpp.o" \
"CMakeFiles/SubpicMergeApp.dir/SubpicMergeMain.cpp.o"

# External object files for target SubpicMergeApp
SubpicMergeApp_EXTERNAL_OBJECTS =

../bin/umake/gcc-9.4/x86_64/release/SubpicMergeApp: source/App/SubpicMergeApp/CMakeFiles/SubpicMergeApp.dir/SubpicMergeApp.cpp.o
../bin/umake/gcc-9.4/x86_64/release/SubpicMergeApp: source/App/SubpicMergeApp/CMakeFiles/SubpicMergeApp.dir/SubpicMergeMain.cpp.o
../bin/umake/gcc-9.4/x86_64/release/SubpicMergeApp: source/App/SubpicMergeApp/CMakeFiles/SubpicMergeApp.dir/build.make
../bin/umake/gcc-9.4/x86_64/release/SubpicMergeApp: ../lib/umake/gcc-9.4/x86_64/release/libCommonLib.a
../bin/umake/gcc-9.4/x86_64/release/SubpicMergeApp: ../lib/umake/gcc-9.4/x86_64/release/libEncoderLib.a
../bin/umake/gcc-9.4/x86_64/release/SubpicMergeApp: ../lib/umake/gcc-9.4/x86_64/release/libDecoderLib.a
../bin/umake/gcc-9.4/x86_64/release/SubpicMergeApp: ../lib/umake/gcc-9.4/x86_64/release/libUtilities.a
../bin/umake/gcc-9.4/x86_64/release/SubpicMergeApp: ../lib/umake/gcc-9.4/x86_64/release/libCommonLib.a
../bin/umake/gcc-9.4/x86_64/release/SubpicMergeApp: source/App/SubpicMergeApp/CMakeFiles/SubpicMergeApp.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/tmp/VVCSoftware_VTM/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable ../../../../bin/umake/gcc-9.4/x86_64/release/SubpicMergeApp"
	cd /tmp/VVCSoftware_VTM/build/source/App/SubpicMergeApp && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/SubpicMergeApp.dir/link.txt --verbose=$(VERBOSE)
	cd /tmp/VVCSoftware_VTM/build/source/App/SubpicMergeApp && /nfs/home/jfilipe.it/.local/lib/python3.8/site-packages/cmake/data/bin/cmake -E copy  /tmp/VVCSoftware_VTM/bin/umake/gcc-9.4/x86_64/release/SubpicMergeApp    /tmp/VVCSoftware_VTM/bin/SubpicMergeAppStatic  

# Rule to build all files generated by this target.
source/App/SubpicMergeApp/CMakeFiles/SubpicMergeApp.dir/build: ../bin/umake/gcc-9.4/x86_64/release/SubpicMergeApp

.PHONY : source/App/SubpicMergeApp/CMakeFiles/SubpicMergeApp.dir/build

source/App/SubpicMergeApp/CMakeFiles/SubpicMergeApp.dir/clean:
	cd /tmp/VVCSoftware_VTM/build/source/App/SubpicMergeApp && $(CMAKE_COMMAND) -P CMakeFiles/SubpicMergeApp.dir/cmake_clean.cmake
.PHONY : source/App/SubpicMergeApp/CMakeFiles/SubpicMergeApp.dir/clean

source/App/SubpicMergeApp/CMakeFiles/SubpicMergeApp.dir/depend:
	cd /tmp/VVCSoftware_VTM/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /tmp/VVCSoftware_VTM /tmp/VVCSoftware_VTM/source/App/SubpicMergeApp /tmp/VVCSoftware_VTM/build /tmp/VVCSoftware_VTM/build/source/App/SubpicMergeApp /tmp/VVCSoftware_VTM/build/source/App/SubpicMergeApp/CMakeFiles/SubpicMergeApp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : source/App/SubpicMergeApp/CMakeFiles/SubpicMergeApp.dir/depend

