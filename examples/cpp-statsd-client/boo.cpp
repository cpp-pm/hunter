#include <cpp-statsd-client/StatsdClient.hpp>
using namespace Statsd;

int main()
{
    // Define the client on localhost, with port 8080, using a prefix and a batching size of 20 bytes
    StatsdClient client{ "127.0.0.1", 8080, "myPrefix.", 20 };

    // Increment the metric "coco"
    client.increment("coco");

    // Decrement the metric "kiki"
    client.decrement("kiki");

    // Adjusts "toto" by +3
    client.count("toto", 2, 0.1f);

    // Record a gauge "titi" to 3
    client.gauge("titi", 3);

    // Record a timing of 2ms for "myTiming"
    client.timing("myTiming", 2, 0.1f);

    // Send a metric explicitly
    client.send("tutu", 4, "c", 2.0f);
}
