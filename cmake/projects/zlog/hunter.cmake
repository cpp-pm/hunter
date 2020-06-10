# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
	PACKAGE_NAME
	zlog
	VERSION
	"1.2.14"
	URL
	"https://github.com/HardySimpson/zlog/archive/1.2.14.tar.gz"
	SHA1
	94e5e7f431093036e1529dcadf11c2d779954886
)

hunter_pick_scheme(DEFAULT url_sha1_make_only)
hunter_cacheable(zlog)
hunter_download(PACKAGE_NAME zlog)
