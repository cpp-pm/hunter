#include <eventpp/eventdispatcher.h>
#include <eventpp/callbacklist.h>

#include <iostream>

int main()
{
  eventpp::EventDispatcher<int, void()> dispatcher;
  dispatcher.appendListener(3, []()
                            { std::cout << "Got event 3." << std::endl; });
  // dispatch event 3
  dispatcher.dispatch(3);
  return 0;
}
