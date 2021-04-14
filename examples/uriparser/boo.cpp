#include <uriparser/Uri.h>

int main() {
    UriUriA uri;
    const char * const uriString = "https://github.com/cpp-pm/hunter";
    const char * errorPos;

    if (uriParseSingleUriA(&uri, uriString, &errorPos) != URI_SUCCESS) {
        return 1;
    }

    /* Success */
    uriFreeUriMembersA(&uri);
    return 0;
}
