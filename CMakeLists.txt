cmake_minimum_required(VERSION 3.0)

project("FastNoise" VERSION "1.0.0.0")

add_library("FastNoise" STATIC "FastNoise.cpp" "FastNoise.h")
target_include_directories("FastNoise" PUBLIC "${FastNoise_SOURCE_DIR}")