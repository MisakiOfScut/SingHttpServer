# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/pc/wws/SingHttpServer

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pc/wws/SingHttpServer/build

# Include any dependencies generated for this target.
include test/CMakeFiles/Buffer_test.dir/depend.make

# Include the progress variables for this target.
include test/CMakeFiles/Buffer_test.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/Buffer_test.dir/flags.make

test/CMakeFiles/Buffer_test.dir/__/src/Buffer/Buffer.cpp.o: test/CMakeFiles/Buffer_test.dir/flags.make
test/CMakeFiles/Buffer_test.dir/__/src/Buffer/Buffer.cpp.o: ../src/Buffer/Buffer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pc/wws/SingHttpServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/Buffer_test.dir/__/src/Buffer/Buffer.cpp.o"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Buffer_test.dir/__/src/Buffer/Buffer.cpp.o -c /home/pc/wws/SingHttpServer/src/Buffer/Buffer.cpp

test/CMakeFiles/Buffer_test.dir/__/src/Buffer/Buffer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Buffer_test.dir/__/src/Buffer/Buffer.cpp.i"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pc/wws/SingHttpServer/src/Buffer/Buffer.cpp > CMakeFiles/Buffer_test.dir/__/src/Buffer/Buffer.cpp.i

test/CMakeFiles/Buffer_test.dir/__/src/Buffer/Buffer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Buffer_test.dir/__/src/Buffer/Buffer.cpp.s"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pc/wws/SingHttpServer/src/Buffer/Buffer.cpp -o CMakeFiles/Buffer_test.dir/__/src/Buffer/Buffer.cpp.s

test/CMakeFiles/Buffer_test.dir/__/src/Buffer/Buffer.cpp.o.requires:

.PHONY : test/CMakeFiles/Buffer_test.dir/__/src/Buffer/Buffer.cpp.o.requires

test/CMakeFiles/Buffer_test.dir/__/src/Buffer/Buffer.cpp.o.provides: test/CMakeFiles/Buffer_test.dir/__/src/Buffer/Buffer.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/Buffer_test.dir/build.make test/CMakeFiles/Buffer_test.dir/__/src/Buffer/Buffer.cpp.o.provides.build
.PHONY : test/CMakeFiles/Buffer_test.dir/__/src/Buffer/Buffer.cpp.o.provides

test/CMakeFiles/Buffer_test.dir/__/src/Buffer/Buffer.cpp.o.provides.build: test/CMakeFiles/Buffer_test.dir/__/src/Buffer/Buffer.cpp.o


test/CMakeFiles/Buffer_test.dir/Buffer_test.cpp.o: test/CMakeFiles/Buffer_test.dir/flags.make
test/CMakeFiles/Buffer_test.dir/Buffer_test.cpp.o: ../test/Buffer_test.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pc/wws/SingHttpServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object test/CMakeFiles/Buffer_test.dir/Buffer_test.cpp.o"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Buffer_test.dir/Buffer_test.cpp.o -c /home/pc/wws/SingHttpServer/test/Buffer_test.cpp

test/CMakeFiles/Buffer_test.dir/Buffer_test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Buffer_test.dir/Buffer_test.cpp.i"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pc/wws/SingHttpServer/test/Buffer_test.cpp > CMakeFiles/Buffer_test.dir/Buffer_test.cpp.i

test/CMakeFiles/Buffer_test.dir/Buffer_test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Buffer_test.dir/Buffer_test.cpp.s"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pc/wws/SingHttpServer/test/Buffer_test.cpp -o CMakeFiles/Buffer_test.dir/Buffer_test.cpp.s

test/CMakeFiles/Buffer_test.dir/Buffer_test.cpp.o.requires:

.PHONY : test/CMakeFiles/Buffer_test.dir/Buffer_test.cpp.o.requires

test/CMakeFiles/Buffer_test.dir/Buffer_test.cpp.o.provides: test/CMakeFiles/Buffer_test.dir/Buffer_test.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/Buffer_test.dir/build.make test/CMakeFiles/Buffer_test.dir/Buffer_test.cpp.o.provides.build
.PHONY : test/CMakeFiles/Buffer_test.dir/Buffer_test.cpp.o.provides

test/CMakeFiles/Buffer_test.dir/Buffer_test.cpp.o.provides.build: test/CMakeFiles/Buffer_test.dir/Buffer_test.cpp.o


test/CMakeFiles/Buffer_test.dir/GTestAll.cpp.o: test/CMakeFiles/Buffer_test.dir/flags.make
test/CMakeFiles/Buffer_test.dir/GTestAll.cpp.o: ../test/GTestAll.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pc/wws/SingHttpServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object test/CMakeFiles/Buffer_test.dir/GTestAll.cpp.o"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Buffer_test.dir/GTestAll.cpp.o -c /home/pc/wws/SingHttpServer/test/GTestAll.cpp

test/CMakeFiles/Buffer_test.dir/GTestAll.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Buffer_test.dir/GTestAll.cpp.i"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pc/wws/SingHttpServer/test/GTestAll.cpp > CMakeFiles/Buffer_test.dir/GTestAll.cpp.i

test/CMakeFiles/Buffer_test.dir/GTestAll.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Buffer_test.dir/GTestAll.cpp.s"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pc/wws/SingHttpServer/test/GTestAll.cpp -o CMakeFiles/Buffer_test.dir/GTestAll.cpp.s

test/CMakeFiles/Buffer_test.dir/GTestAll.cpp.o.requires:

.PHONY : test/CMakeFiles/Buffer_test.dir/GTestAll.cpp.o.requires

test/CMakeFiles/Buffer_test.dir/GTestAll.cpp.o.provides: test/CMakeFiles/Buffer_test.dir/GTestAll.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/Buffer_test.dir/build.make test/CMakeFiles/Buffer_test.dir/GTestAll.cpp.o.provides.build
.PHONY : test/CMakeFiles/Buffer_test.dir/GTestAll.cpp.o.provides

test/CMakeFiles/Buffer_test.dir/GTestAll.cpp.o.provides.build: test/CMakeFiles/Buffer_test.dir/GTestAll.cpp.o


# Object files for target Buffer_test
Buffer_test_OBJECTS = \
"CMakeFiles/Buffer_test.dir/__/src/Buffer/Buffer.cpp.o" \
"CMakeFiles/Buffer_test.dir/Buffer_test.cpp.o" \
"CMakeFiles/Buffer_test.dir/GTestAll.cpp.o"

# External object files for target Buffer_test
Buffer_test_EXTERNAL_OBJECTS =

test/Buffer_test: test/CMakeFiles/Buffer_test.dir/__/src/Buffer/Buffer.cpp.o
test/Buffer_test: test/CMakeFiles/Buffer_test.dir/Buffer_test.cpp.o
test/Buffer_test: test/CMakeFiles/Buffer_test.dir/GTestAll.cpp.o
test/Buffer_test: test/CMakeFiles/Buffer_test.dir/build.make
test/Buffer_test: /usr/local/lib/libgtest.a
test/Buffer_test: /usr/local/lib/libgtest_main.a
test/Buffer_test: test/CMakeFiles/Buffer_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pc/wws/SingHttpServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable Buffer_test"
	cd /home/pc/wws/SingHttpServer/build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Buffer_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/Buffer_test.dir/build: test/Buffer_test

.PHONY : test/CMakeFiles/Buffer_test.dir/build

test/CMakeFiles/Buffer_test.dir/requires: test/CMakeFiles/Buffer_test.dir/__/src/Buffer/Buffer.cpp.o.requires
test/CMakeFiles/Buffer_test.dir/requires: test/CMakeFiles/Buffer_test.dir/Buffer_test.cpp.o.requires
test/CMakeFiles/Buffer_test.dir/requires: test/CMakeFiles/Buffer_test.dir/GTestAll.cpp.o.requires

.PHONY : test/CMakeFiles/Buffer_test.dir/requires

test/CMakeFiles/Buffer_test.dir/clean:
	cd /home/pc/wws/SingHttpServer/build/test && $(CMAKE_COMMAND) -P CMakeFiles/Buffer_test.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/Buffer_test.dir/clean

test/CMakeFiles/Buffer_test.dir/depend:
	cd /home/pc/wws/SingHttpServer/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pc/wws/SingHttpServer /home/pc/wws/SingHttpServer/test /home/pc/wws/SingHttpServer/build /home/pc/wws/SingHttpServer/build/test /home/pc/wws/SingHttpServer/build/test/CMakeFiles/Buffer_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/Buffer_test.dir/depend

