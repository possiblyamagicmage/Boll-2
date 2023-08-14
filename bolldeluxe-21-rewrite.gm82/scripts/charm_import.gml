///charm_import()
global.characters=0
dir=global.workdir+"vanilla\character\"
i=0
for (file=file_find_first(dir+"*",fa_directory);file!="";file=file_find_next()) {
    if (directory_exists(dir+file)) if (file!="." && file!="..") {list[i]=dir+file i+=1}
} file_find_close()

for (j=0;j<i;j+=1) charm_load(list[j],0)

global.charmstart=global.characters

dir=global.workdir+"mods\character\"
i=0
for (file=file_find_first(dir+"*",fa_directory);file!="";file=file_find_next()) {
    if (directory_exists(dir+file)) if (file!="." && file!="..") {list[i]=dir+file i+=1}
} file_find_close()

for (j=0;j<i;j+=1) charm_load(list[j],1)

if room==game with charm_playertest charm_init()
