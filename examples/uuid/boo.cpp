#include <uuid.h>
#include <iostream>

int main() {
    char sguid[37];
    uuid_t uuid = {0};
    uuid_generate(uuid);
    uuid_unparse(uuid, sguid);
    std::cout << sguid << std::endl;
    return 0;
}
