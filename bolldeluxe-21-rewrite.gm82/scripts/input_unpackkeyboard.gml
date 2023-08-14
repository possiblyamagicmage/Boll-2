//unpack keyboard mappings
var str,i,p;

str=game_settings("keyboard1")
for (i=0;i<11;i+=1) {
    p=string_pos("|",str)
    global.key[i,0]=real(string_copy(str,1,p-1))
    str=string_delete(str,1,p)
}
str=game_settings("keyboard2")
for (i=0;i<11;i+=1) {
    p=string_pos("|",str)
    global.key[i,1]=real(string_copy(str,1,p-1))
    str=string_delete(str,1,p)
}
