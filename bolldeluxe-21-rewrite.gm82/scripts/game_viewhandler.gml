///game_viewhandler(zoom level)
//updates views to account for the pixel hack

view_visible[0]=1

view_wport[0]=400
view_hport[0]=224
view_wport[1]=400
view_hport[1]=224
view_wport[2]=400
view_hport[2]=224
view_wport[3]=400
view_hport[3]=224

view_xport[0]=0
view_yport[0]=0

if (global.mplay=2) {
    view_xport[1]=0
    view_yport[1]=224+4
}
if (global.mplay=3) {
    view_xport[1]=400+4
    view_yport[1]=0
    view_xport[2]=204
    view_yport[2]=224+4
}
if (global.mplay=4) {
    view_xport[1]=400+4
    view_yport[1]=0
    view_xport[2]=0
    view_yport[2]=224+4
    view_xport[3]=400+4
    view_yport[3]=224+4
}
/*
if (room=lemon) {
    view_wview[0]=rw
    view_hview[0]=rh
    view_wport[0]=view_wview[0]
    view_hport[0]=view_hview[0]
}
if (room=speciale && !instance_exists(moranboll)) {
    view_wview[0]=rw
    view_hview[0]=rh
    view_wport[0]=view_wview[0]
    view_hport[0]=view_hview[0]
}
*/
var sw,sh;
for (i=0;i<4;i+=1) {
    if (global.full && argument[0]!=1) {
        sw=dw/rw
        sh=dh/rh
        view_xport[i]=floor(view_xport[i]*sw)
        view_yport[i]=floor(view_yport[i]*sh)
        view_wport[i]=ceil(view_wport[i]*sw)
        view_hport[i]=ceil(view_hport[i]*sh)
    } else {
        view_xport[i]=floor(view_xport[i]*argument[0])
        view_yport[i]=floor(view_yport[i]*argument[0])
        view_wport[i]=ceil(view_wport[i]*argument[0])
        view_hport[i]=ceil(view_hport[i]*argument[0])
    }
}
