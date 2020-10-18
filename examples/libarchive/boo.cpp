
#include <string>

#include <archive.h>
#include <archive_entry.h>

int main(int argc, char *argv[])
{
    static std::string CONTENT = "Hello, World!\n";

    char buf[32 * 1024];
    size_t used;
    auto arc = archive_write_new();
    archive_write_add_filter_gzip(arc);
    archive_write_set_format_pax_restricted(arc);
    archive_write_open_memory(arc, buf, sizeof(buf), &used);
    auto entry = archive_entry_new();
    archive_entry_set_pathname(entry, "hw.txt");
    archive_entry_set_size(entry, CONTENT.size());
    archive_entry_set_filetype(entry, AE_IFREG);
    archive_entry_set_perm(entry, 0644);
    archive_write_header(arc, entry);
    archive_write_data(arc, CONTENT.c_str(), CONTENT.size());
    archive_entry_free(entry);
    archive_write_close(arc);
    archive_write_free(arc);
}
