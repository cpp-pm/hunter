#include <aws/lambda-runtime/runtime.h>

using namespace aws::lambda_runtime;

invocation_response handler(invocation_request const& req)
{
    return invocation_response::success("{\"stuff\": 42}", "application/json");
}

int main()
{
    run_handler(handler);
    return 0;
}
