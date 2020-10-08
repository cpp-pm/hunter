#include <cgltf.h>

static void set(cgltf_float target[3], float x, float y, float z) {
    target[0] = x;
    target[1] = y;
    target[2] = z;
}

int main() {
    cgltf_node node = {};
    set(node.scale, 1, 1, 1);
    return 0;
}
