///listmenu(obj,arg1,arg2,...) Max of 15 object arguments.
for (j=0;j<16;j+=1) {
    if (j<argument_count) argnamelist[argument[0],j]=argument[j]
    else argnamelist[argument[0],j]=""
}
ds_map_add(lemonargname,argument[0],argument_count-1)
