///charm_load(filename,modded)
var fn,state,script,c,f,str,name,protecc,i;

//this is /*"/**/ and it collects open strings and open comments
protecc="/*"+qt+"/**/"

state=0
script=""
c=global.characters
movesetpage=0

name=filename_name(argument[0])
if (argument[1] && global.savefile=global.savedir+"1705052159.cfg") exit //please do not remove this line it is my test switch -moster

for (i=0;string(global.movelist[c,i])!="0";i+=1) global.movelist[c,i]=""
for (i=0;i<5;i+=1) global.pagespec[c,i]=-1
//for compatibility
global.pagespec[c,0]=0
global.damagercode[c]=""
global.projectilecode[c]=""
global.deathcode[c]=""
global.spritelist[c]=""
global.soundlist[c]=""
global.charmod[c]=argument[1]
global.charicon[c,0]=spr_unknown
global.chariconr[c]=spr_chariconb
global.chariconb[c]=spr_unknown
global.charname[c]=name
global.charbio[c]=""
global.chargames[c]=""
global.chardata[c]="No data."
global.changecode[c]=""
global.rosterswap[c]=""

fn=argument[0]+"\"+name+".gml"

if (!file_exists(fn) || !file_exists(filename_change_ext(fn,"-card.png")) || !file_exists(argument[0]+"\"+"player.txt")) exit

for ({f=file_text_open_read(fn) str=""};!file_text_eof(f);file_text_readln(f)) {
    str=string_replace_all(file_text_read_string(f),chr(9)," ")
    if (string_replace_all(str," ","")=="") continue
    if (str="#" && state=4) str=""
    if (string_pos("#define",str)) {
        if (state=-1) script+=protecc+"return 0}"+lf
        if (string_pos("rosterorder",str)) state=1
        else if (string_pos("spritelist",str)) state=2
        else if (string_pos("soundlist",str)) state=3
        else if (string_pos("movelist",str)) state=4
        else if (string_pos("damager",str)) state=5
        else if (string_pos("projectile",str)) state=6
        else if (string_pos("description",str)) state=7
        else if (string_pos("death",str)) state=8
        else if (string_pos("customchange",str)) state=9
        else if (string_pos("rosterswap",str)) state=10
        else {
            state=-1
            script+="if (entrypoint="+qt+string_letters(string_replace(str,"#define",""))+qt+") {"+protecc+lf
        }                                                                                        
        continue
    }
    if (state=1) {global.rosterorder[c]=unreal(str,0) state=0}
    if (state=2) {global.spritelist[c]=str state=0}
    if (state=3) {global.soundlist[c]=str state=0}
    //if (state=4) {addmovelist(c,str)}
    if (state=5) {global.damagercode[c]+=str+lf}
    if (state=6) {global.projectilecode[c]+=str+lf}
    if (state=7) {global.chardata[c]=str state=0}
    if (state=8) {global.deathcode[c]+=str+lf}
    if (state=9) {global.changecode[c]+=str+lf}
    if (state=10) {global.rosterswap[c]+=str}
    if (state=-1) script+=str+lf
} file_text_close(f)
if (state=-1) script+=protecc+" return 0}"+lf

if (script="") {error("Error loading charm file:##"+fn+"##No code found.") exit}

global.charicon[c,0]=sprite_add(filename_change_ext(fn,"-card.png"),1,0,0,12,12)
if (global.charicon[c,0]) {
    if (sprite_get_width(global.charicon[c,0])!=24 || sprite_get_height(global.charicon[c,0])!=24) {
        error("charm icon not 24x24: "+filename_change_ext(fn,"-card.png"))
        sprite_delete(global.charicon[c,0])
        global.charicon[c,0]=spr_unknown
    }
} else global.charicon[c,0]=spr_unknown

global.chariconr[c]=sprite_add(filename_change_ext(fn,"-replay.png"),1,1,0,0,0)    
if (global.chariconr[c]) {
    if (sprite_get_width(global.chariconr[c])!=10 || sprite_get_height(global.chariconr[c])!=10) {
        error("replay icon not 10x10: "+filename_change_ext(fn,"-replay.png"))
        sprite_delete(global.chariconr[c])
        global.chariconr[c]=spr_chariconb
    }
} else global.chariconr[c]=spr_chariconb

global.chariconb[c]=sprite_add(argument[0]+"\bio.png",1,1,0,0,0)
if (global.chariconb[c]) {
    if (sprite_get_width(global.chariconb[c]) mod 48!=0 || sprite_get_height(global.chariconb[c])!=48) {
        error("charm bio not 48x48 or a multiple: "+argument[0]+"\bio.png")
        sprite_delete(global.chariconb[c])
        global.chariconb[c]=spr_unknown
    }
} else global.chariconb[c]=spr_unknown

if (file_exists(argument[0]+"\bio.txt")) {
    f=file_text_open_read(argument[0]+"\bio.txt")
    if (f) {
        global.charbio[c]=file_text_read_string(f)
        file_text_readln(f)
        global.chargames[c]=file_text_read_string(f)
        file_text_close(f)
    }
}

str=string_antivirus(script)
if (str!=script) error("Error loading charm file:##"+fn+"##Forbidden keyword detected:##"+str+"##For safety reasons, please remove this keyword from your code in order to load this mod.",0)
else script=str

str=string_antivirus(global.damagercode[c])
if (str!=global.damagercode[c]) error("Error loading charm file:##"+fn+"##Forbidden keyword detected:##"+str+"##For safety reasons, please remove this keyword from your code in order to load this mod.",0)
else global.damagercode[c]=str

str=string_antivirus(global.projectilecode[c])
if (str!=global.projectilecode[c]) error("Error loading charm file:##"+fn+"##Forbidden keyword detected:##"+str+"##For safety reasons, please remove this keyword from your code in order to load this mod.",0)
else global.projectilecode[c]=str

str=string_antivirus(global.deathcode[c])
if (str!=global.deathcode[c]) error("Error loading charm file:##"+fn+"##Forbidden keyword detected:##"+str+"##For safety reasons, please remove this keyword from your code in order to load this mod.",0)
else global.deathcode[c]=str

str=string_antivirus(global.changecode[c])
if (str!=global.changecode[c]) error("Error loading charm file:##"+fn+"##Forbidden keyword detected:##"+str+"##For safety reasons, please remove this keyword from your code in order to load this mod.",0)
else global.changecode[c]=str

error_occurred=0      
with (instance_create(0,0,compiler_dummy)) {
    entrypoint="null_test"
    execute_string(script)
    event="null_test"
    execute_string(global.projectilecode[c])
    owner=id
    execute_string(global.damagercode[c])
    execute_string(global.deathcode[c])
    instance_destroy()
}
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
    if (!argument[1]) error("charm error in vanilla character: "+name,1)
} else {
    global.charcode[c]=script 
}

//if room!=game//dont reapply skin when it's being used
//applyplayerskin(global.pbase,0,"all",global.characters)

global.characters+=1

global.notfirstreload=1
