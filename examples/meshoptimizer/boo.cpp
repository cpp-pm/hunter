#include <meshoptimizer/meshoptimizer.h>
#include <meshoptimizer/gltfpack.h>

int main() {
    meshopt_remapIndexBuffer(NULL, NULL, 0, NULL);
    printf("gltfpack %s\n", getVersion().c_str());
    return 0;
}
