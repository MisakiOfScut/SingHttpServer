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
include test/CMakeFiles/Server_test.dir/depend.make

# Include the progress variables for this target.
include test/CMakeFiles/Server_test.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/Server_test.dir/flags.make

test/CMakeFiles/Server_test.dir/__/src/Http/HttpContext.cpp.o: test/CMakeFiles/Server_test.dir/flags.make
test/CMakeFiles/Server_test.dir/__/src/Http/HttpContext.cpp.o: ../src/Http/HttpContext.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pc/wws/SingHttpServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/Server_test.dir/__/src/Http/HttpContext.cpp.o"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Server_test.dir/__/src/Http/HttpContext.cpp.o -c /home/pc/wws/SingHttpServer/src/Http/HttpContext.cpp

test/CMakeFiles/Server_test.dir/__/src/Http/HttpContext.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Server_test.dir/__/src/Http/HttpContext.cpp.i"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pc/wws/SingHttpServer/src/Http/HttpContext.cpp > CMakeFiles/Server_test.dir/__/src/Http/HttpContext.cpp.i

test/CMakeFiles/Server_test.dir/__/src/Http/HttpContext.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Server_test.dir/__/src/Http/HttpContext.cpp.s"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pc/wws/SingHttpServer/src/Http/HttpContext.cpp -o CMakeFiles/Server_test.dir/__/src/Http/HttpContext.cpp.s

test/CMakeFiles/Server_test.dir/__/src/Http/HttpContext.cpp.o.requires:

.PHONY : test/CMakeFiles/Server_test.dir/__/src/Http/HttpContext.cpp.o.requires

test/CMakeFiles/Server_test.dir/__/src/Http/HttpContext.cpp.o.provides: test/CMakeFiles/Server_test.dir/__/src/Http/HttpContext.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/Server_test.dir/build.make test/CMakeFiles/Server_test.dir/__/src/Http/HttpContext.cpp.o.provides.build
.PHONY : test/CMakeFiles/Server_test.dir/__/src/Http/HttpContext.cpp.o.provides

test/CMakeFiles/Server_test.dir/__/src/Http/HttpContext.cpp.o.provides.build: test/CMakeFiles/Server_test.dir/__/src/Http/HttpContext.cpp.o


test/CMakeFiles/Server_test.dir/__/src/Http/HttpResponse.cpp.o: test/CMakeFiles/Server_test.dir/flags.make
test/CMakeFiles/Server_test.dir/__/src/Http/HttpResponse.cpp.o: ../src/Http/HttpResponse.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pc/wws/SingHttpServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object test/CMakeFiles/Server_test.dir/__/src/Http/HttpResponse.cpp.o"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Server_test.dir/__/src/Http/HttpResponse.cpp.o -c /home/pc/wws/SingHttpServer/src/Http/HttpResponse.cpp

test/CMakeFiles/Server_test.dir/__/src/Http/HttpResponse.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Server_test.dir/__/src/Http/HttpResponse.cpp.i"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pc/wws/SingHttpServer/src/Http/HttpResponse.cpp > CMakeFiles/Server_test.dir/__/src/Http/HttpResponse.cpp.i

test/CMakeFiles/Server_test.dir/__/src/Http/HttpResponse.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Server_test.dir/__/src/Http/HttpResponse.cpp.s"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pc/wws/SingHttpServer/src/Http/HttpResponse.cpp -o CMakeFiles/Server_test.dir/__/src/Http/HttpResponse.cpp.s

test/CMakeFiles/Server_test.dir/__/src/Http/HttpResponse.cpp.o.requires:

.PHONY : test/CMakeFiles/Server_test.dir/__/src/Http/HttpResponse.cpp.o.requires

test/CMakeFiles/Server_test.dir/__/src/Http/HttpResponse.cpp.o.provides: test/CMakeFiles/Server_test.dir/__/src/Http/HttpResponse.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/Server_test.dir/build.make test/CMakeFiles/Server_test.dir/__/src/Http/HttpResponse.cpp.o.provides.build
.PHONY : test/CMakeFiles/Server_test.dir/__/src/Http/HttpResponse.cpp.o.provides

test/CMakeFiles/Server_test.dir/__/src/Http/HttpResponse.cpp.o.provides.build: test/CMakeFiles/Server_test.dir/__/src/Http/HttpResponse.cpp.o


test/CMakeFiles/Server_test.dir/__/src/Http/HttpServer.cpp.o: test/CMakeFiles/Server_test.dir/flags.make
test/CMakeFiles/Server_test.dir/__/src/Http/HttpServer.cpp.o: ../src/Http/HttpServer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pc/wws/SingHttpServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object test/CMakeFiles/Server_test.dir/__/src/Http/HttpServer.cpp.o"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Server_test.dir/__/src/Http/HttpServer.cpp.o -c /home/pc/wws/SingHttpServer/src/Http/HttpServer.cpp

test/CMakeFiles/Server_test.dir/__/src/Http/HttpServer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Server_test.dir/__/src/Http/HttpServer.cpp.i"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pc/wws/SingHttpServer/src/Http/HttpServer.cpp > CMakeFiles/Server_test.dir/__/src/Http/HttpServer.cpp.i

test/CMakeFiles/Server_test.dir/__/src/Http/HttpServer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Server_test.dir/__/src/Http/HttpServer.cpp.s"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pc/wws/SingHttpServer/src/Http/HttpServer.cpp -o CMakeFiles/Server_test.dir/__/src/Http/HttpServer.cpp.s

test/CMakeFiles/Server_test.dir/__/src/Http/HttpServer.cpp.o.requires:

.PHONY : test/CMakeFiles/Server_test.dir/__/src/Http/HttpServer.cpp.o.requires

test/CMakeFiles/Server_test.dir/__/src/Http/HttpServer.cpp.o.provides: test/CMakeFiles/Server_test.dir/__/src/Http/HttpServer.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/Server_test.dir/build.make test/CMakeFiles/Server_test.dir/__/src/Http/HttpServer.cpp.o.provides.build
.PHONY : test/CMakeFiles/Server_test.dir/__/src/Http/HttpServer.cpp.o.provides

test/CMakeFiles/Server_test.dir/__/src/Http/HttpServer.cpp.o.provides.build: test/CMakeFiles/Server_test.dir/__/src/Http/HttpServer.cpp.o


test/CMakeFiles/Server_test.dir/__/src/Timer/TimerManager.cpp.o: test/CMakeFiles/Server_test.dir/flags.make
test/CMakeFiles/Server_test.dir/__/src/Timer/TimerManager.cpp.o: ../src/Timer/TimerManager.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pc/wws/SingHttpServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object test/CMakeFiles/Server_test.dir/__/src/Timer/TimerManager.cpp.o"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Server_test.dir/__/src/Timer/TimerManager.cpp.o -c /home/pc/wws/SingHttpServer/src/Timer/TimerManager.cpp

test/CMakeFiles/Server_test.dir/__/src/Timer/TimerManager.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Server_test.dir/__/src/Timer/TimerManager.cpp.i"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pc/wws/SingHttpServer/src/Timer/TimerManager.cpp > CMakeFiles/Server_test.dir/__/src/Timer/TimerManager.cpp.i

test/CMakeFiles/Server_test.dir/__/src/Timer/TimerManager.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Server_test.dir/__/src/Timer/TimerManager.cpp.s"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pc/wws/SingHttpServer/src/Timer/TimerManager.cpp -o CMakeFiles/Server_test.dir/__/src/Timer/TimerManager.cpp.s

test/CMakeFiles/Server_test.dir/__/src/Timer/TimerManager.cpp.o.requires:

.PHONY : test/CMakeFiles/Server_test.dir/__/src/Timer/TimerManager.cpp.o.requires

test/CMakeFiles/Server_test.dir/__/src/Timer/TimerManager.cpp.o.provides: test/CMakeFiles/Server_test.dir/__/src/Timer/TimerManager.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/Server_test.dir/build.make test/CMakeFiles/Server_test.dir/__/src/Timer/TimerManager.cpp.o.provides.build
.PHONY : test/CMakeFiles/Server_test.dir/__/src/Timer/TimerManager.cpp.o.provides

test/CMakeFiles/Server_test.dir/__/src/Timer/TimerManager.cpp.o.provides.build: test/CMakeFiles/Server_test.dir/__/src/Timer/TimerManager.cpp.o


test/CMakeFiles/Server_test.dir/__/src/Buffer/Buffer.cpp.o: test/CMakeFiles/Server_test.dir/flags.make
test/CMakeFiles/Server_test.dir/__/src/Buffer/Buffer.cpp.o: ../src/Buffer/Buffer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pc/wws/SingHttpServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object test/CMakeFiles/Server_test.dir/__/src/Buffer/Buffer.cpp.o"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Server_test.dir/__/src/Buffer/Buffer.cpp.o -c /home/pc/wws/SingHttpServer/src/Buffer/Buffer.cpp

test/CMakeFiles/Server_test.dir/__/src/Buffer/Buffer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Server_test.dir/__/src/Buffer/Buffer.cpp.i"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pc/wws/SingHttpServer/src/Buffer/Buffer.cpp > CMakeFiles/Server_test.dir/__/src/Buffer/Buffer.cpp.i

test/CMakeFiles/Server_test.dir/__/src/Buffer/Buffer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Server_test.dir/__/src/Buffer/Buffer.cpp.s"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pc/wws/SingHttpServer/src/Buffer/Buffer.cpp -o CMakeFiles/Server_test.dir/__/src/Buffer/Buffer.cpp.s

test/CMakeFiles/Server_test.dir/__/src/Buffer/Buffer.cpp.o.requires:

.PHONY : test/CMakeFiles/Server_test.dir/__/src/Buffer/Buffer.cpp.o.requires

test/CMakeFiles/Server_test.dir/__/src/Buffer/Buffer.cpp.o.provides: test/CMakeFiles/Server_test.dir/__/src/Buffer/Buffer.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/Server_test.dir/build.make test/CMakeFiles/Server_test.dir/__/src/Buffer/Buffer.cpp.o.provides.build
.PHONY : test/CMakeFiles/Server_test.dir/__/src/Buffer/Buffer.cpp.o.provides

test/CMakeFiles/Server_test.dir/__/src/Buffer/Buffer.cpp.o.provides.build: test/CMakeFiles/Server_test.dir/__/src/Buffer/Buffer.cpp.o


test/CMakeFiles/Server_test.dir/__/src/Epoll/Epoll.cpp.o: test/CMakeFiles/Server_test.dir/flags.make
test/CMakeFiles/Server_test.dir/__/src/Epoll/Epoll.cpp.o: ../src/Epoll/Epoll.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pc/wws/SingHttpServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object test/CMakeFiles/Server_test.dir/__/src/Epoll/Epoll.cpp.o"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Server_test.dir/__/src/Epoll/Epoll.cpp.o -c /home/pc/wws/SingHttpServer/src/Epoll/Epoll.cpp

test/CMakeFiles/Server_test.dir/__/src/Epoll/Epoll.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Server_test.dir/__/src/Epoll/Epoll.cpp.i"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pc/wws/SingHttpServer/src/Epoll/Epoll.cpp > CMakeFiles/Server_test.dir/__/src/Epoll/Epoll.cpp.i

test/CMakeFiles/Server_test.dir/__/src/Epoll/Epoll.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Server_test.dir/__/src/Epoll/Epoll.cpp.s"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pc/wws/SingHttpServer/src/Epoll/Epoll.cpp -o CMakeFiles/Server_test.dir/__/src/Epoll/Epoll.cpp.s

test/CMakeFiles/Server_test.dir/__/src/Epoll/Epoll.cpp.o.requires:

.PHONY : test/CMakeFiles/Server_test.dir/__/src/Epoll/Epoll.cpp.o.requires

test/CMakeFiles/Server_test.dir/__/src/Epoll/Epoll.cpp.o.provides: test/CMakeFiles/Server_test.dir/__/src/Epoll/Epoll.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/Server_test.dir/build.make test/CMakeFiles/Server_test.dir/__/src/Epoll/Epoll.cpp.o.provides.build
.PHONY : test/CMakeFiles/Server_test.dir/__/src/Epoll/Epoll.cpp.o.provides

test/CMakeFiles/Server_test.dir/__/src/Epoll/Epoll.cpp.o.provides.build: test/CMakeFiles/Server_test.dir/__/src/Epoll/Epoll.cpp.o


test/CMakeFiles/Server_test.dir/Server_test.cpp.o: test/CMakeFiles/Server_test.dir/flags.make
test/CMakeFiles/Server_test.dir/Server_test.cpp.o: ../test/Server_test.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pc/wws/SingHttpServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object test/CMakeFiles/Server_test.dir/Server_test.cpp.o"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Server_test.dir/Server_test.cpp.o -c /home/pc/wws/SingHttpServer/test/Server_test.cpp

test/CMakeFiles/Server_test.dir/Server_test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Server_test.dir/Server_test.cpp.i"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pc/wws/SingHttpServer/test/Server_test.cpp > CMakeFiles/Server_test.dir/Server_test.cpp.i

test/CMakeFiles/Server_test.dir/Server_test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Server_test.dir/Server_test.cpp.s"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pc/wws/SingHttpServer/test/Server_test.cpp -o CMakeFiles/Server_test.dir/Server_test.cpp.s

test/CMakeFiles/Server_test.dir/Server_test.cpp.o.requires:

.PHONY : test/CMakeFiles/Server_test.dir/Server_test.cpp.o.requires

test/CMakeFiles/Server_test.dir/Server_test.cpp.o.provides: test/CMakeFiles/Server_test.dir/Server_test.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/Server_test.dir/build.make test/CMakeFiles/Server_test.dir/Server_test.cpp.o.provides.build
.PHONY : test/CMakeFiles/Server_test.dir/Server_test.cpp.o.provides

test/CMakeFiles/Server_test.dir/Server_test.cpp.o.provides.build: test/CMakeFiles/Server_test.dir/Server_test.cpp.o


test/CMakeFiles/Server_test.dir/GTestAll.cpp.o: test/CMakeFiles/Server_test.dir/flags.make
test/CMakeFiles/Server_test.dir/GTestAll.cpp.o: ../test/GTestAll.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pc/wws/SingHttpServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object test/CMakeFiles/Server_test.dir/GTestAll.cpp.o"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Server_test.dir/GTestAll.cpp.o -c /home/pc/wws/SingHttpServer/test/GTestAll.cpp

test/CMakeFiles/Server_test.dir/GTestAll.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Server_test.dir/GTestAll.cpp.i"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pc/wws/SingHttpServer/test/GTestAll.cpp > CMakeFiles/Server_test.dir/GTestAll.cpp.i

test/CMakeFiles/Server_test.dir/GTestAll.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Server_test.dir/GTestAll.cpp.s"
	cd /home/pc/wws/SingHttpServer/build/test && /usr/bin/x86_64-linux-gnu-g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pc/wws/SingHttpServer/test/GTestAll.cpp -o CMakeFiles/Server_test.dir/GTestAll.cpp.s

test/CMakeFiles/Server_test.dir/GTestAll.cpp.o.requires:

.PHONY : test/CMakeFiles/Server_test.dir/GTestAll.cpp.o.requires

test/CMakeFiles/Server_test.dir/GTestAll.cpp.o.provides: test/CMakeFiles/Server_test.dir/GTestAll.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/Server_test.dir/build.make test/CMakeFiles/Server_test.dir/GTestAll.cpp.o.provides.build
.PHONY : test/CMakeFiles/Server_test.dir/GTestAll.cpp.o.provides

test/CMakeFiles/Server_test.dir/GTestAll.cpp.o.provides.build: test/CMakeFiles/Server_test.dir/GTestAll.cpp.o


# Object files for target Server_test
Server_test_OBJECTS = \
"CMakeFiles/Server_test.dir/__/src/Http/HttpContext.cpp.o" \
"CMakeFiles/Server_test.dir/__/src/Http/HttpResponse.cpp.o" \
"CMakeFiles/Server_test.dir/__/src/Http/HttpServer.cpp.o" \
"CMakeFiles/Server_test.dir/__/src/Timer/TimerManager.cpp.o" \
"CMakeFiles/Server_test.dir/__/src/Buffer/Buffer.cpp.o" \
"CMakeFiles/Server_test.dir/__/src/Epoll/Epoll.cpp.o" \
"CMakeFiles/Server_test.dir/Server_test.cpp.o" \
"CMakeFiles/Server_test.dir/GTestAll.cpp.o"

# External object files for target Server_test
Server_test_EXTERNAL_OBJECTS =

test/Server_test: test/CMakeFiles/Server_test.dir/__/src/Http/HttpContext.cpp.o
test/Server_test: test/CMakeFiles/Server_test.dir/__/src/Http/HttpResponse.cpp.o
test/Server_test: test/CMakeFiles/Server_test.dir/__/src/Http/HttpServer.cpp.o
test/Server_test: test/CMakeFiles/Server_test.dir/__/src/Timer/TimerManager.cpp.o
test/Server_test: test/CMakeFiles/Server_test.dir/__/src/Buffer/Buffer.cpp.o
test/Server_test: test/CMakeFiles/Server_test.dir/__/src/Epoll/Epoll.cpp.o
test/Server_test: test/CMakeFiles/Server_test.dir/Server_test.cpp.o
test/Server_test: test/CMakeFiles/Server_test.dir/GTestAll.cpp.o
test/Server_test: test/CMakeFiles/Server_test.dir/build.make
test/Server_test: /usr/local/lib/libgtest.a
test/Server_test: /usr/local/lib/libgtest_main.a
test/Server_test: test/CMakeFiles/Server_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pc/wws/SingHttpServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Linking CXX executable Server_test"
	cd /home/pc/wws/SingHttpServer/build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Server_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/Server_test.dir/build: test/Server_test

.PHONY : test/CMakeFiles/Server_test.dir/build

test/CMakeFiles/Server_test.dir/requires: test/CMakeFiles/Server_test.dir/__/src/Http/HttpContext.cpp.o.requires
test/CMakeFiles/Server_test.dir/requires: test/CMakeFiles/Server_test.dir/__/src/Http/HttpResponse.cpp.o.requires
test/CMakeFiles/Server_test.dir/requires: test/CMakeFiles/Server_test.dir/__/src/Http/HttpServer.cpp.o.requires
test/CMakeFiles/Server_test.dir/requires: test/CMakeFiles/Server_test.dir/__/src/Timer/TimerManager.cpp.o.requires
test/CMakeFiles/Server_test.dir/requires: test/CMakeFiles/Server_test.dir/__/src/Buffer/Buffer.cpp.o.requires
test/CMakeFiles/Server_test.dir/requires: test/CMakeFiles/Server_test.dir/__/src/Epoll/Epoll.cpp.o.requires
test/CMakeFiles/Server_test.dir/requires: test/CMakeFiles/Server_test.dir/Server_test.cpp.o.requires
test/CMakeFiles/Server_test.dir/requires: test/CMakeFiles/Server_test.dir/GTestAll.cpp.o.requires

.PHONY : test/CMakeFiles/Server_test.dir/requires

test/CMakeFiles/Server_test.dir/clean:
	cd /home/pc/wws/SingHttpServer/build/test && $(CMAKE_COMMAND) -P CMakeFiles/Server_test.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/Server_test.dir/clean

test/CMakeFiles/Server_test.dir/depend:
	cd /home/pc/wws/SingHttpServer/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pc/wws/SingHttpServer /home/pc/wws/SingHttpServer/test /home/pc/wws/SingHttpServer/build /home/pc/wws/SingHttpServer/build/test /home/pc/wws/SingHttpServer/build/test/CMakeFiles/Server_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/Server_test.dir/depend
