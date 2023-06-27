#include <fmt/format.h> // The full format API. Lightweight subset of formatting functions is fmt/core.h

int main() {
  fmt::print("Hello world\nThis is fmt(ex-cppformat)\n");
  std::string as_string = fmt::format("The answer is {}", 42);
  auto buf = fmt::memory_buffer();
  fmt::format_to(std::back_inserter(buf), "{}\nThe previous line and this message were bufferred in memory", as_string);
  // We can not use buf.data() directly. To convert buffer to string use fmt::to_string(buf). It uses buf.size() to determine correct string size!!!
  fmt::print(stderr, "{}\nAnd then were printed to stderr\n", fmt::to_string(buf));
  fmt::print("Fmt supports many nice features, see {url} for details\n", fmt::arg("url", "https://github.com/fmtlib/fmt"));
}
