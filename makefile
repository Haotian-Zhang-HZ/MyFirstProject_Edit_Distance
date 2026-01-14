CXX = g++
CXXFLAGS = -std=c++17 -Wall -Iinclude -fprofile-arcs -ftest-coverage
INCLUDES = -I/opt/homebrew/include
LDFLAGS = -L/opt/homebrew/lib
LIBS = -lgtest -lgtest_main -lpthread

SRC = src/edit_distance.cpp 
TEST = test/edit_distance_test.cpp
OBJ = $(SRC:.cpp=.o) $(TEST:.cpp=.o)

.PHONY: all clean

all : main test

src/edit_distance.o: src/edit_distance.cpp 
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $^ -o $@

test/edit_distance_test.o: $(TEST) 
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $^ -o $@

main: main.cpp src/edit_distance.o
	$(CXX) $(CXXFLAGS) $(INCLUDES) $^ -o $@

test: test/edit_distance_test.o src/edit_distance.o
	$(CXX) $(CXXFLAGS) $(INCLUDES) $(LDFLAGS) $^  $(LIBS) -o test_runner
	./test_runner

coverage: test
	gcov $(SRC)

# coverage_html : test
# 	lcov --capture -directory . --output-file coverage.info --ignore-errors inconsistent,source
# 	lcov --remove coverage.info '/usr/*' '/opt/homebrew/include/*' --output-file coverage.info
# 	genhtml coverage.info --output-directory ./coverage_html
# 	open coverage_html/index.html
# # $^ 所有依赖文件

coverage_html: src/edit_distance.o
	
	lcov --capture --directory src --output-file coverage.info
	
	lcov --remove coverage.info '/usr/*' '/opt/homebrew/include/*' --output-file coverage.info.cleaned --ignore-errors unused
	genhtml coverage.info.cleaned --output-directory ./coverage_html
	open coverage_html/index.html

clean:
	rm -f main test_runner src/*.o test/*.o src/*.gcno src/*.gcda *.gcov
	rm -f coverage.info coverage.info.cleaned
	rm -rf coverage_html
