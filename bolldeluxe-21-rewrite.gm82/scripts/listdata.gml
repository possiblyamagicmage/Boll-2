///listdata(obj,arg1,arg2,...) Max of 15 object arguments.
for (j=0;j<16;j+=1) {
    if (j<argument_count) datalist[argument[0],j]=argument[j]
    else arglist[argument[0],j]=""
}
ds_map_add(lemonargdata,argument[0],argument_count-1)
