cmake_minimum_required(VERSION 3.20.0)
project(cuda_test VERSION 0.1.0 LANGUAGES CXX C)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 定义选项
option(USE_CUDA "Enable CUDA backend" ON)

if(USE_CUDA)
    enable_language(CUDA)  # 动态启用 CUDA
    find_package(CUDAToolkit REQUIRED)
    set(CMAKE_CUDA_ARCHITECTURES "86")  # 计算能力8.6
endif()

add_subdirectory(mma_swizzle)