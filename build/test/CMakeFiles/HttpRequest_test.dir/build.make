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
include test/CMakeFiles/HttpRequest_test.dir/depend.make

# Include the progress variables for this target.
include test/CMakeFiles/HttpRequest_test.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/HttpRequest_test.dir/flags.make

test/CMakeFiles/HttpRequest_test.dir/__/src/Http/HttpContext.cpp.o: test/CMakeFiles/HttpRequest_test.dir/flags.make
test/CMakeFiles/HttpRequest_test.dir/__/src/Http/HttpContext.cpp.o: ../src/Http/HttpContext.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pc/wws/SingHttpServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/HttpRequest_test.dir/__/src/Http/HttpContext.cpp.o"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/HttpRequest_test.dir/__/src/Http/HttpContext.cpp.o -c /home/pc/wws/SingHttpServer/src/Http/HttpContext.cpp

test/CMakeFiles/HttpRequest_test.dir/__/src/Http/HttpContext.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HttpRequest_test.dir/__/src/Http/HttpContext.cpp.i"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pc/wws/SingHttpServer/src/Http/HttpContext.cpp > CMakeFiles/HttpRequest_test.dir/__/src/Http/HttpContext.cpp.i

test/CMakeFiles/HttpRequest_test.dir/__/src/Http/HttpContext.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HttpRequest_test.dir/__/src/Http/HttpContext.cpp.s"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pc/wws/SingHttpServer/src/Http/HttpContext.cpp -o CMakeFiles/HttpRequest_test.dir/__/src/Http/HttpContext.cpp.s

test/CMakeFiles/HttpRequest_test.dir/__/src/Http/HttpContext.cpp.o.requires:

.PHONY : test/CMakeFiles/HttpRequest_test.dir/__/src/Http/HttpContext.cpp.o.requires

test/CMakeFiles/HttpRequest_test.dir/__/src/Http/HttpContext.cpp.o.provides: test/CMakeFiles/HttpRequest_test.dir/__/src/Http/HttpContext.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/HttpRequest_test.dir/build.make test/CMakeFiles/HttpRequest_test.dir/__/src/Http/HttpContext.cpp.o.provides.build
.PHONY : test/CMakeFiles/HttpRequest_test.dir/__/src/Http/HttpContext.cpp.o.provides

test/CMakeFiles/HttpRequest_test.dir/__/src/Http/HttpContext.cpp.o.provides.build: test/CMakeFiles/HttpRequest_test.dir/__/src/Http/HttpContext.cpp.o


test/CMakeFiles/HttpRequest_test.dir/__/src/Buffer/Buffer.cpp.o: test/CMakeFiles/HttpRequest_test.dir/flags.make
test/CMakeFiles/HttpRequest_test.dir/__/src/Buffer/Buffer.cpp.o: ../src/Buffer/Buffer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pc/wws/SingHttpServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object test/CMakeFiles/HttpRequest_test.dir/__/src/Buffer/Buffer.cpp.o"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/HttpRequest_test.dir/__/src/Buffer/Buffer.cpp.o -c /home/pc/wws/SingHttpServer/src/Buffer/Buffer.cpp

test/CMakeFiles/HttpRequest_test.dir/__/src/Buffer/Buffer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HttpRequest_test.dir/__/src/Buffer/Buffer.cpp.i"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pc/wws/SingHttpServer/src/Buffer/Buffer.cpp > CMakeFiles/HttpRequest_test.dir/__/src/Buffer/Buffer.cpp.i

test/CMakeFiles/HttpRequest_test.dir/__/src/Buffer/Buffer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HttpRequest_test.dir/__/src/Buffer/Buffer.cpp.s"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pc/wws/SingHttpServer/src/Buffer/Buffer.cpp -o CMakeFiles/HttpRequest_test.dir/__/src/Buffer/Buffer.cpp.s

test/CMakeFiles/HttpRequest_test.dir/__/src/Buffer/Buffer.cpp.o.requires:

.PHONY : test/CMakeFiles/HttpRequest_test.dir/__/src/Buffer/Buffer.cpp.o.requires

test/CMakeFiles/HttpRequest_test.dir/__/src/Buffer/Buffer.cpp.o.provides: test/CMakeFiles/HttpRequest_test.dir/__/src/Buffer/Buffer.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/HttpRequest_test.dir/build.make test/CMakeFiles/HttpRequest_test.dir/__/src/Buffer/Buffer.cpp.o.provides.build
.PHONY : test/CMakeFiles/HttpRequest_test.dir/__/src/Buffer/Buffer.cpp.o.provides

test/CMakeFiles/HttpRequest_test.dir/__/src/Buffer/Buffer.cpp.o.provides.build: test/CMakeFiles/HttpRequest_test.dir/__/src/Buffer/Buffer.cpp.o


test/CMakeFiles/HttpRequest_test.dir/HttpRequest_test.cpp.o: test/CMakeFiles/HttpRequest_test.dir/flags.make
test/CMakeFiles/HttpRequest_test.dir/HttpRequest_test.cpp.o: ../test/HttpRequest_test.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pc/wws/SingHttpServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object test/CMakeFiles/HttpRequest_test.dir/HttpRequest_test.cpp.o"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/HttpRequest_test.dir/HttpRequest_test.cpp.o -c /home/pc/wws/SingHttpServer/test/HttpRequest_test.cpp

test/CMakeFiles/HttpRequest_test.dir/HttpRequest_test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HttpRequest_test.dir/HttpRequest_test.cpp.i"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pc/wws/SingHttpServer/test/HttpRequest_test.cpp > CMakeFiles/HttpRequest_test.dir/HttpRequest_test.cpp.i

test/CMakeFiles/HttpRequest_test.dir/HttpRequest_test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HttpRequest_test.dir/HttpRequest_test.cpp.s"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pc/wws/SingHttpServer/test/HttpRequest_test.cpp -o CMakeFiles/HttpRequest_test.dir/HttpRequest_test.cpp.s

test/CMakeFiles/HttpRequest_test.dir/HttpRequest_test.cpp.o.requires:

.PHONY : test/CMakeFiles/HttpRequest_test.dir/HttpRequest_test.cpp.o.requires

test/CMakeFiles/HttpRequest_test.dir/HttpRequest_test.cpp.o.provides: test/CMakeFiles/HttpRequest_test.dir/HttpRequest_test.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/HttpRequest_test.dir/build.make test/CMakeFiles/HttpRequest_test.dir/HttpRequest_test.cpp.o.provides.build
.PHONY : test/CMakeFiles/HttpRequest_test.dir/HttpRequest_test.cpp.o.provides

test/CMakeFiles/HttpRequest_test.dir/HttpRequest_test.cpp.o.provides.build: test/CMakeFiles/HttpRequest_test.dir/HttpRequest_test.cpp.o


test/CMakeFiles/HttpRequest_test.dir/GTestAll.cpp.o: test/CMakeFiles/HttpRequest_test.dir/flags.make
test/CMakeFiles/HttpRequest_test.dir/GTestAll.cpp.o: ../test/GTestAll.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pc/wws/SingHttpServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object test/CMakeFiles/HttpRequest_test.dir/GTestAll.cpp.o"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/HttpRequest_test.dir/GTestAll.cpp.o -c /home/pc/wws/SingHttpServer/test/GTestAll.cpp

test/CMakeFiles/HttpRequest_test.dir/GTestAll.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HttpRequest_test.dir/GTestAll.cpp.i"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pc/wws/SingHttpServer/test/GTestAll.cpp > CMakeFiles/HttpRequest_test.dir/GTestAll.cpp.i

test/CMakeFiles/HttpRequest_test.dir/GTestAll.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HttpRequest_test.dir/GTestAll.cpp.s"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pc/wws/SingHttpServer/test/GTestAll.cpp -o CMakeFiles/HttpRequest_test.dir/GTestAll.cpp.s

test/CMakeFiles/HttpRequest_test.dir/GTestAll.cpp.o.requires:

.PHONY : test/CMakeFiles/HttpRequest_test.dir/GTestAll.cpp.o.requires

test/CMakeFiles/HttpRequest_test.dir/GTestAll.cpp.o.provides: test/CMakeFiles/HttpRequest_test.dir/GTestAll.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/HttpRequest_test.dir/build.make test/CMakeFiles/HttpRequest_test.dir/GTestAll.cpp.o.provides.build
.PHONY : test/CMakeFiles/HttpRequest_test.dir/GTestAll.cpp.o.provides

test/CMakeFiles/HttpRequest_test.dir/GTestAll.cpp.o.provides.build: test/CMakeFiles/HttpRequest_test.dir/GTestAll.cpp.o


# Object files for target HttpRequest_test
HttpRequest_test_OBJECTS = \
"CMakeFiles/HttpRequest_test.dir/__/src/Http/HttpContext.cpp.o" \
"CMakeFiles/HttpRequest_test.dir/__/src/Buffer/Buffer.cpp.o" \
"CMakeFiles/HttpRequest_test.dir/HttpRequest_test.cpp.o" \
"CMakeFiles/HttpRequest_test.dir/GTestAll.cpp.o"

# External object files for target HttpRequest_test
HttpRequest_test_EXTERNAL_OBJECTS =

test/HttpRequest_test: test/CMakeFiles/HttpRequest_test.dir/__/src/Http/HttpContext.cpp.o
test/HttpRequest_test: test/CMakeFiles/HttpRequest_test.dir/__/src/Buffer/Buffer.cpp.o
test/HttpRequest_test: test/CMakeFiles/HttpRequest_test.dir/HttpRequest_test.cpp.o
test/HttpRequest_test: test/CMakeFiles/HttpRequest_test.dir/GTestAll.cpp.o
test/HttpRequest_test: test/CMakeFiles/HttpRequest_test.dir/build.make
test/HttpRequest_test: /usr/local/lib/libgtest.a
test/HttpRequest_test: /usr/local/lib/libgtest_main.a
test/HttpRequest_test: test/CMakeFiles/HttpRequest_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pc/wws/SingHttpServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable HttpRequest_test"
	cd /home/pc/wws/SingHttpServer/build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/HttpRequest_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/HttpRequest_test.dir/build: test/HttpRequest_test

.PHONY : test/CMakeFiles/HttpRequest_test.dir/build

test/CMakeFiles/HttpRequest_test.dir/requires: test/CMakeFiles/HttpRequest_test.dir/__/src/Http/HttpContext.cpp.o.requires
test/CMakeFiles/HttpRequest_test.dir/requires: test/CMakeFiles/HttpRequest_test.dir/__/src/Buffer/Buffer.cpp.o.requires
test/CMakeFiles/HttpRequest_test.dir/requires: test/CMakeFiles/HttpRequest_test.dir/HttpRequest_test.cpp.o.requires
test/CMakeFiles/HttpRequest_test.dir/requires: test/CMakeFiles/HttpRequest_test.dir/GTestAll.cpp.o.requires

.PHONY : test/CMakeFiles/HttpRequest_test.dir/requires

test/CMakeFiles/HttpRequest_test.dir/clean:
	cd /home/pc/wws/SingHttpServer/build/test && $(CMAKE_COMMAND) -P CMakeFiles/HttpRequest_test.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/HttpRequest_test.dir/clean

test/CMakeFiles/HttpRequest_test.dir/depend:
	cd /home/pc/wws/SingHttpServer/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pc/wws/SingHttpServer /home/pc/wws/SingHttpServer/test /home/pc/wws/SingHttpServer/build /home/pc/wws/SingHttpServer/build/test /home/pc/wws/SingHttpServer/build/test/CMakeFiles/HttpRequest_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/HttpRequest_test.dir/depend

