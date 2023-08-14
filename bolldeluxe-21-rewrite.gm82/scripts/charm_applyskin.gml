///charm_applyskin(directory,-1) player base
///charm_applyskin(directory,slot,"all",character) load all for this character
///charm_applyskin(directory,slot,"less",character) for roster, loads less
///charm_applyskin(directory,slot,"more",character) for roster end

//applies a player skin to the specified slot
var i,what,slot,char,path;

path=argument[0]
slot=argument[1]
what="all"

if (argument_count=2) {
    what="all"
    char=0
} else {
    what=argument[2]
    char=argument[3]
}

//make sure base is applied before changing skins
//if (path!=global.pbase) charm_applyskin(global.pbase,slot,what,char)

//with (globalmanager) {


    skin=path


    if (what=="more") skin_string("infotxt"+string(slot),skin+"player.txt")
    skin_string("lang credits","")
    if (skin=global.pbase) {
        if (global.charmod[char]) {
            skin_replaceinfo(moddir+"character\"+global.charname[char]+"\"+"player.txt")
            skin_replacecharacter(char,slot,what,moddir+"character\"+global.charname[char]+"\")
        } else {
            skin_replaceinfo(skin+global.charname[char]+"\"+"player.txt")
            skin_replacecharacter(char,slot,what,skin+"_shared\")
            skin_replacecharacter(char,slot,what,skin+global.charname[char]+"\")
        }
    } else {
        skin_replaceinfo(skin+"player.txt")
        skin_replacecharacter(char,slot,what,skin)

    }
    skin_string("credits"+string(slot),skin_string("lang credits"))

    return 1
//}
return 0
