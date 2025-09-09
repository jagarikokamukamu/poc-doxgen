# Makefile for Doxygen documentation generation and Google Test build/run

# --- Tools & Directories ---
DOXYGEN    = doxygen
DOXYFILE   = Doxyfile
DOC_DIR    = docs
BUILD_DIR  = build
OBJ_DIR    = $(BUILD_DIR)/obj

# --- Source Files & Objects ---
SRC_DIR      = src
GTEST_DIR    = gtest
INCLUDE_DIR  = include

MAIN_SRC     = $(SRC_DIR)/main.cpp
SRCS_TO_TEST = $(filter-out $(MAIN_SRC), $(wildcard $(SRC_DIR)/*.cpp))

MAIN_OBJS    = $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(SRCS_TO_TEST)) $(OBJ_DIR)/main.o
GTEST_OBJS   = $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(SRCS_TO_TEST)) $(patsubst $(GTEST_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(wildcard $(GTEST_DIR)/*.cpp))

# --- Binaries ---
MAIN_BIN     = $(BUILD_DIR)/main
GTEST_BIN    = $(BUILD_DIR)/hello_test

# --- Compiler & Flags ---
CXX          = g++
CXXFLAGS     = -std=c++17 -I/usr/include/gtest -pthread -I$(INCLUDE_DIR)
LDFLAGS      = -lgtest -lgtest_main -pthread

# --- Targets ---
.PHONY: all doc clean open build main test

all: doc build

build: $(MAIN_BIN) $(GTEST_BIN)

main: $(MAIN_BIN)

test: $(GTEST_BIN)
	@echo "Running Google Test..."
	$(GTEST_BIN)

$(MAIN_BIN): $(MAIN_OBJS)
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $^ -o $@

$(GTEST_BIN): $(GTEST_OBJS)
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $^ -o $@ $(LDFLAGS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(OBJ_DIR)/%.o: $(GTEST_DIR)/%.cpp
	@mkdir -p $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# (Doxygen, clean, open targets remain the same)
doc:
	@echo "Generating documentation with Doxygen..."
	$(DOXYGEN) $(DOXYFILE)

clean:
	@echo "Cleaning documentation and build output..."
	rm -rf $(DOC_DIR) $(BUILD_DIR)

open:
	@echo "Opening documentation in browser..."
	$(BROWSER) $(DOC_DIR)/html/index.html
