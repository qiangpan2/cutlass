add_subdirectory(common)

add_executable(hgemm_v1_mma_m16n8k16_naive_kernel
    hgemm_v1_mma_m16n8k16_naive_kernel.cu
)
target_link_libraries(hgemm_v1_mma_m16n8k16_naive_kernel PRIVATE common)
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    target_compile_options(hgemm_v1_mma_m16n8k16_naive_kernel PRIVATE $<$<COMPILE_LANGUAGE:CUDA>:-G>)
else()
    target_compile_options(hgemm_v1_mma_m16n8k16_naive_kernel PRIVATE -lineinfo)
endif()