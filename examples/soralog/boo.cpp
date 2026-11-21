#include <soralog/impl/configurator_from_yaml.hpp>
#include <soralog/logging_system.hpp>
#include <soralog/logger.hpp>

#include <cstdlib>
#include <iostream>
#include <memory>
#include <string>

int main() {
  auto configurator =
      std::make_shared<soralog::ConfiguratorFromYAML>(std::string(R"(
sinks:
  - name: console
    type: console
groups:
  - name: main
    sink: console
    level: info
    is_fallback: true
)"));

  soralog::LoggingSystem log_system(configurator);
  auto result = log_system.configure();
  if (result.has_error) {
    std::cerr << result.message << '\n';
    return EXIT_FAILURE;
  }

  auto logger = log_system.getLogger("boo", "main");
  logger->info("Hello from soralog {}", 42);
  return EXIT_SUCCESS;
}
