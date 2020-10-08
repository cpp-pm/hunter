#include <fast_obj.h>

int main() {
    fastObjMesh* mesh = fast_obj_read(0);
    if(mesh) return 0;
    return 1;
}
