///replacecharacter(id,slot,"all",dir) //load entire skin
///replacecharacter(id,slot,"less",dir) //load only roster
///replacecharacter(id,slot,"more",dir) //load roster remainder
//apply character skin
var slot,ss,i,index,what,dir,str,p;

index=argument[0]
slot=argument[1]
what=argument[2]
dir=argument[3]
charmusdir=argument[3] //Hey all, -S- here,. this extra variable may be unnecessary, but sadly I don't know if it's good to use dir as a non local variable, if it is, then great, tell me and I'll change it so that this thing is unnecesary again


name=global.charname[index]

ss=string(slot)

if (what="less" || what="all") {
    skin_string("name"+ss,skin_string(name+" name"))
    skin_data("noicon"+ss,(skin_replacesheet(slot,name+"icon",dir+name+"-icon.png",0,0,1)=-1))
    skin_data("iconspd"+ss,1/median(1,unreal(skin_data(name+" icon speed"),8),255))
    skin_data("iconloop"+ss,funnytruefalse(skin_data(name+" icon loop")))
    skin_data("iconloopback"+ss,unreal(skin_data(name+" icon loop back"),0))
}

if (what="more" || what="all") { 
    sheets[0]=skin_replacesheet(slot,name+"0",dir+name+"-basic.png",0,0,1)
    sheets[1]=skin_replacesheet(slot,name+"1",dir+name+"-big.png",0,0,1)
    sheets[2]=skin_replacesheet(slot,name+"2",dir+name+"-fire.png",0,0,1)
    sheets[3]=skin_replacesheet(slot,name+"3",dir+name+"-feather.png",0,0,1)
    sheets[4]=skin_replacesheet(slot,name+"4",dir+name+"-extra.png",0,0,1)
    //I sure hope this works! - -S-
    //Hey so, I've chosen a funny way to do this, the array for animdata is slot,k
    //k serving for the id of the data, I'm going to have it so that it's actually
    //size*10+slot, since slot is just the p2 number and it can only reach up to 3
    skin_animationdata(slot,name,global.spritelist[index],0)
    skin_animationdata(slot,name,global.spritelist[index],1)
    skin_animationdata(slot,name,global.spritelist[index],2)
    skin_animationdata(slot,name,global.spritelist[index],3)
    skin_animationdata(slot,name,global.spritelist[index],4)
    //Any mod can if they want to, just use skin_animationdata for themselves to add animation data for any extra sizes
}
