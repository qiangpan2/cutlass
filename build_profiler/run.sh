# 针对RTX 4090 (Ada Lovelace架构，计算能力8.9)配置CMake
cmake .. \
  -DCUTLASS_NVCC_ARCHS=89 \
  -DCUTLASS_LIBRARY_OPERATIONS=gemm \
  -DCUTLASS_ENABLE_CUBLAS=ON \
  -DCUTLASS_ENABLE_CUDNN=OFF \
  -DCMAKE_BUILD_TYPE=Release \
  -DCUTLASS_UNITY_BUILD_ENABLED=ON

make cutlass_profiler -j$(nproc)

./tools/profiler/cutlass_profiler \
  --operation=Gemm \
  --A=f16:column \
  --B=f16:column \
  --C=f32:column \
  --m=4096 --n=4096 --k=4096 \
  --alpha=1.0 --beta=0.0 \
  --providers=cutlass > gemm_result_4096_4096_4096.txt