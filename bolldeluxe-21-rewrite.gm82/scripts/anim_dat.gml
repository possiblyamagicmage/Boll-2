///anim_dat(slot,name,list)
//animation data is weird as heck

var slot,name,i,j,list,tokens,c,tokens2,c2;

slot=argument[0]
name=argument[1]
list=argument[2]

if (list="") exit

c=0
do {
    p=string_pos(",",list)
    if (p=0) {if (list!="") tokens[c]=list c+=1}
    else {
        tokens[c]=string_copy(list,1,p-1) c+=1
        list=string_delete(list,1,p)
    }
} until (p=0)

for (i=0;i<c;i+=1) {
    k=16+128*i //1d array :P

    /*
        k value table
        k+0 name
        k+1 frames small
        k+2 frames big
        k+3 frames fire
        k+4 frames feather
        k+5 speed
        k+6 loop
        k+7... frame times
    */

    spr=tokens[i]
    global.animdat[slot,k]=spr

    //read frame count list
    t=string(skindat(name+" "+spr+" frames"))
    j=0 do {
        p=string_pos(",",t)
        if (p) {
            global.animdat[slot,k+1+j]=unreal(string_copy(t,1,p-1),1)
            t=string_delete(t,1,p)
        } else global.animdat[slot,k+1+j]=unreal(t,1)
        j+=1
    } until (!p) repeat (5-j) {global.animdat[slot,k+1+j]=global.animdat[slot,k+j] j+=1}

    t=unreal(skindat(name+" "+spr+" speed"),1) if (t=0) t=1 global.animdat[slot,k+6]=t
    global.animdat[slot,k+7]=max(1,unreal(skindat(name+" "+spr+" loop"),1))

    list=string(skindat(name+" "+spr+" frametimes"))

    c2=0
    do {
        p=string_pos(",",list)
        if (p=0) {if (list!="") tokens2[c2]=list c2+=1}
        else {
            tokens2[c2]=string_copy(list,1,p-1) c2+=1
            list=string_delete(list,1,p)
        }
    } until (p=0)

    if (list="0") {
        for (j=0;j<global.animdat[slot,k+1];j+=1) {
            global.animdat[slot,k+8+j]=1
        }
    } else {
        for (j=0;j<global.animdat[slot,k+1];j+=1) {
            global.animdat[slot,k+8+j]=max(1,unreal(tokens2[j],1))
        }
    }
}

global.animdat[slot,0]=c
global.animdat[slot,1]=max(1,unreal(skindat(name+" box width"),48))
global.animdat[slot,2]=max(1,unreal(skindat(name+" box height"),48))
global.animdat[slot,3]=unreal(skindat(name+" center x"),24)
global.animdat[slot,4]=unreal(skindat(name+" center y"),28)
global.animdat[slot,5]=median(0,unreal(skindat(name+" animation speed"),1.0),10)
