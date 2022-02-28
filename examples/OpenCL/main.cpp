// Needed for mingw compiles
#if defined _WIN32 && defined __unix__
  #define WINVER 0x0601
  #define _WIN32_WINNT 0x0601
#endif

#include <CL/cl.h>

int main()
{
    cl_platform_id platform_id = NULL;
    cl_uint ret_num_platforms;

    clGetPlatformIDs(1, &platform_id, &ret_num_platforms);
    return 0;
}
