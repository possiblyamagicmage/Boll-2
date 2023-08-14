///skin_animationdata(slot,name,list,size) I, XxX_-S-man_Xxx, understand how this script functions.



var slot,name,size,i,j,list,tokens,c,tokens2,c2,sizename;

slot=argument[0]
name=argument[1]
list=argument[2]
size=argument[3]


if (list="") exit

c=0
//Scan the sprite list for all the individual sprite names.
do {
    p=string_pos(",",list)
    if (p=0) {if (list!="") tokens[c]=list c+=1}
    else {
        tokens[c]=string_copy(list,1,p-1) c+=1
        list=string_delete(list,1,p)
    }
} until (p=0)


switch (size){
    case 0: sizename="basic" break;
    case 1: sizename="big" break;
    case 2: sizename="fire" break;
    case 3: sizename="feather" break;
    case 4: sizename="extra" break;
    default: sizename=string(size) break;
}

for (i=0;i<c;i+=1) {
    k=16+128*i //1d array :P

    /*
        k value table
        k+0 animation name
        k+1 frames
        k+2 speed
        k+3 loop
        k+4... frame times
    */

    spr=tokens[i]
    global.animdat[slot+size*10,k]=spr


    //read frame count list
    //the below code was mega simplified since we don't have to deal with the commas for different sizes.
    //I'm utilizing the defaults of nozerounreal here so that in the case that it doesn't actually find the tag it just goes for a non size specific version. i.e, one without a tag.
    global.animdat[slot+size*10,k+1]=nozerounreal(skin_data(sizename+ " " + name+" "+spr+" frames"),unreal(skin_data(name+" "+spr+" frames"),1))
    //read animation speed
    
    t=nozerounreal(skin_data(sizename+ " " +name+" "+spr+" speed"),unreal(skin_data(name+" "+spr+" speed"),1) ) 
    if (t=0) t=1 
    global.animdat[slot+size*10,k+2]=t
    //read animation loop
    global.animdat[slot+size*10,k+3]=max(1,nozerounreal(skin_data(sizename+ " " +name+" "+spr+" loop"),unreal(skin_data(name+" "+spr+" loop"),1)) )
      
   
    
    
    list=string(skin_data(sizename+ " " +name+" "+spr+" frametimes"))
    if list=""  list=string(skin_data(name+" "+spr+" frametimes"))
    

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
            global.animdat[slot,k+4+j]=1
        }
    } else {
        for (j=0;j<global.animdat[slot,k+1];j+=1) {
            global.animdat[slot,k+4+j]=max(1,unreal(tokens2[j],1))
        }
    }
}

global.animdat[slot,0]=c
global.animdat[slot+size*10,1]=max(1,nozerounreal(skin_data(sizename+ " " +name+" box width"),unreal(skin_data(name+" box width"),48)))
global.animdat[slot+size*10,2]=max(1,nozerounreal(skin_data(sizename+ " " +name+" box height"),unreal(skin_data(name+" box height"),48)))
global.animdat[slot+size*10,3]=nozerounreal(skin_data(sizename+ " " +name+" center x"),unreal(skin_data(name+" center x"),24))
global.animdat[slot+size*10,4]=nozerounreal(skin_data(sizename+ " " +name+" center y"),unreal(skin_data(name+" center y"),28))
global.animdat[slot+size*10,5]=median(0,nozerounreal(skin_data(sizename+ " " +name+" animation speed"),unreal(skin_data(name+" animation speed"),1.0)),10)
global.animdat[slot+size*10,6]=nozerounreal(skin_data(sizename+ " " +name+" pole center offset"),unreal(skin_data(name+" pole center offset"),8))
