///search_return_file(file extension)
//opens a file menu for a specific file type and returns the contents of the selected file.
var extension;
var file;
var filecontents;
extension=argument[0]
file = get_open_filename(" |*"+extension, "");
if file != ""
{
    return(file);
}
else
return 0;
