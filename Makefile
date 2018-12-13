CXX ?= g++
LINK ?= g++
NDKDIR ?= /usr/local/Nuke11.1v6/
CXXFLAGS ?= -std=c++11 \
            -g -c \
            -fPIC -msse 
LINKFLAGS += -shared
LIBS ?= 

SRC_DIR = .
OBJ_DIR = .
PLUGIN_DIR = .
SRC_FILES = $(wildcard $(SRC_DIR)/*.cpp)
OBJ_FILES = $(patsubst $(SRC_DIR)/%.cpp, $(OBJ_DIR)/%.os, $(SRC_FILES))
PLUGIN_FILES = $(patsubst $(SRC_DIR)/%.cpp, $(PLUGIN_DIR)/%.so, $(SRC_FILES))

all: what $(PLUGIN_FILES)

what:
	@echo $(SRC_FILES); \
	echo $(OBJ_FILES); \
	echo $(PLUGIN_FILES); \
	echo $(PLUGIN_DIR)/%.so;

# make object files from source
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -o $(@) $<

# link object files into plugins
$(PLUGIN_DIR)/%.so: $(OBJ_DIR)/%.o
	$(LINK) $(LINKFLAGS) $(LIBS) -o $(@) $<


clean:
	rm -rf $(OBJ_DIR)/*.o \
	       $(PLUGIN_DIR)/*.so

