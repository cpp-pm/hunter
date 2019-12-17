#include <zstd.h>

int main() {
  ZSTD_DCtx *_decompression_ctx = ZSTD_createDCtx();
  ZSTD_freeDCtx(_decompression_ctx);
  return 0;
}
