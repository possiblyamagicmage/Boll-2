///charm_init()
//updates the skin variables (and charm)
var ss;

ss=string(p2)

name=global.charname[global.option[p2]]

if (object_index=charm_playertest) {
    object_event_clear(charm_playertest,ev_other,ev_user0+p2)
    object_event_add(charm_playertest,ev_other,ev_user0+p2,global.charcode[global.option[p2]])
    /*object_event_clear(damager,ev_other,ev_user0+p2)
    object_event_add(damager,ev_other,ev_user0+p2,global.damagercode[global.option[p2]])
    object_event_clear(projectile,ev_other,ev_user0+p2)
    object_event_add(projectile,ev_other,ev_user0+p2,global.projectilecode[global.option[p2]])
    object_event_clear(charmdeath,ev_other,ev_user0+p2)
    object_event_add(charmdeath,ev_other,ev_user0+p2,global.deathcode[global.option[p2]])
    mydamager=instance_create(x,y,damager) {
        mydamager.p2=p2
        mydamager.owner=id
    }*/

}
if object_index=changectrl && global.gamemode!="battle"{
stopiniting=1
object_event_clear(changectrl,ev_other,ev_user0+p2)
    object_event_add(changectrl,ev_other,ev_user0+p2,global.changecode[global.option[p2]])
}

//sheets[0]=skin_data("tex_"+name+"0"+ss)
//sheets[1]=skin_data("tex_"+name+"1"+ss)
//sheets[2]=skin_data("tex_"+name+"2"+ss)
//sheets[3]=skin_data("tex_"+name+"3"+ss)
//sheets[4]=skin_data("tex_"+name+"4"+ss)
sheetshields=skin_data("tex_"+name+"shields"+ss)

shieldanimspeed=skin_data("spdshield"+ss)
if shieldanimspeed<=0 shieldanimspeed=1
offshield=skin_data("offshield"+ss)
addbde=skin_data("addbde"+ss)
cushud=skin_data("cushud"+ss)
firelength=skin_data("firelen"+ss)
viclength=skin_data("viclen"+ss)
carryoffx=skin_data("carryx"+ss)
carryoffy=skin_data("carryy"+ss)
bowlag=skin_data("bowlag"+ss)
maxwait=skin_data("maxwait"+ss)
squishyness=skin_data("squish"+ss)
afterimageblend=skin_data("afterimageblend"+ss)

//We'll have to dinamically change the values later, for now they can stay here.
sprw=global.animdat[p2,1]
sprh=global.animdat[p2,2]
sprcx=global.animdat[p2,3]
sprcy=global.animdat[p2,4]
animf=global.animdat[p2,5]
poleoffx=global.animdat[p2,6]
pxsc=1
mxsc=1
pysc=1
mysc=1
