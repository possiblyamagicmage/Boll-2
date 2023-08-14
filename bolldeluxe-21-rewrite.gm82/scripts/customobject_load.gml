///customobject_load(filename,id,entrypoint)
//this is basically charm but butchered up to work with custom objects instead uhh idk how this works all that much sorry.....
var fn,state,script,c,f,str,name,protecc,i;

//this is /*"/**/ and it collects open strings and open comments
protecc="/*"+qt+"/**/"

state=0
script=""
movesetpage=0

entrypoint=argument[2]

name=filename_name(argument[0])

fn=argument[0]

if (!file_exists(fn)) exit
for ({f=file_text_open_read(fn) str=""};!file_text_eof(f);file_text_readln(f)) {
    str=string_replace_all(file_text_read_string(f),chr(9)," ")
    if (string_replace_all(str," ","")=="") continue
    if (string_pos("#define",str)) {
        if (state==-1) script+=protecc+"}"+lf
        state=-1
        script+="if (entrypoint="+qt+string_letters(string_replace(str,"#define",""))+qt+") {"+protecc+lf                                                                                      
        continue
    }
    if (state==-1) script+=str+lf
} file_text_close(f)
if (state==-1) script+=protecc+"}"+lf

if (script=="") {error("Error loading gml file:##"+fn+"##No code found.") exit}

str=string_antivirus(script)
if (str!=script) error("Error loading gml file:##"+fn+"##Forbidden keyword detected:##"+str+"##For safety reasons, please remove this keyword from your code in order to load this mod.",0)
else script=str

error_occurred=0      
execute_string(script)

if (error_occurred) {
    file_delete(argument[0]+"\errors.txt")
    if (file_exists(argument[0]+"\errors.txt"))
        file_rename("game_errors.log",argument[0]+"\errors.txt")
    else {
        f=file_text_open_write(argument[0]+"\errors.txt")
        file_text_write_string(f,error_last)
        file_text_close(f)
    }
    error_occurred=0
} else {
    global.customobjscript[argument[1]]=script 
}
