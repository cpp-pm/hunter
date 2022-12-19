
#include <boost/url.hpp>
#include <iostream>

using namespace boost::urls;

int main() {
    // example taken from here: https://www.boost.org/doc/libs/1_81_0/libs/url/doc/html/url/overview.html#url.overview.quick_look.accessing
    url_view u( "https://user:pass@example.com:443/path/to/my%2dfile.txt?id=42&name=John%20Doe+Jingleheimer%2DSchmidt#page%20anchor" );

    assert(u.scheme() == "https");
    assert(u.authority().buffer() == "user:pass@example.com:443");
    assert(u.userinfo() == "user:pass");
    assert(u.user() == "user");
    assert(u.password() == "pass");
    assert(u.host() == "example.com");
    assert(u.port() == "443");
    assert(u.path() == "/path/to/my-file.txt");
    assert(u.query() == "id=42&name=John Doe+Jingleheimer-Schmidt");
    assert(u.fragment() == "page anchor");

    std::cout <<
        "url       : " << u                     << "\n"
        "scheme    : " << u.scheme()            << "\n"
        "authority : " << u.encoded_authority() << "\n"
        "userinfo  : " << u.encoded_userinfo()  << "\n"
        "user      : " << u.encoded_user()      << "\n"
        "password  : " << u.encoded_password()  << "\n"
        "host      : " << u.encoded_host()      << "\n"
        "port      : " << u.port()              << "\n"
        "path      : " << u.encoded_path()      << "\n"
        "query     : " << u.encoded_query()     << "\n"
        "fragment  : " << u.encoded_fragment()  << "\n";

}
