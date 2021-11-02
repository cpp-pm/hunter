#include <ittnotify.h>

int main() {
  // pause data collection:
  __itt_pause();
  
  // Start data collection
  __itt_resume();
}
