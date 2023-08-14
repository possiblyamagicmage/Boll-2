//this script adapts rooms for the current number of players

getwindowsize()

rm=room_first
do {
    /*if (rm!=lemon && !(rm=speciale && !instance_exists(moranboll)))
        room_set_view(rm,0,1,0,0,400,224,0,0,400*s,224*s,0,0,0,0,noone)
    if (rm=scoring || rm=game || rm=change) {*/
        room_set_view(rm,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
        room_set_view(rm,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
        room_set_view(rm,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

        if (global.mplay=2) {
            room_set_view(rm,0,1,0,0,480,270,0,0,480*s,270*s,0,0,0,0,noone)
            room_set_view(rm,1,1,0,0,480,270,0,274*s,480*s,270*s,0,0,0,0,noone)
        }
        if (global.mplay=3) {
            room_set_view(rm,1,1,0,0,480,270,484*s,0,480*s,270*s,0,0,0,0,noone)
            room_set_view(rm,2,1,0,0,480,270,204*s,274*s,480*s,270*s,0,0,0,0,noone)
        }
        if (global.mplay=4) {
            room_set_view(rm,1,1,0,0,480,270,484*s,0,480*s,270*s,0,0,0,0,noone)
            room_set_view(rm,2,1,0,0,480,270,0,274*s,480*s,270*s,0,0,0,0,noone)
            room_set_view(rm,3,1,0,0,480,270,484*s,274*s,480*s,270*s,0,0,0,0,noone)
        }
    //}

    rm=room_next(rm)
} until (rm=-1)
/*
room_set_view(credroll,0,1,0,0,400,224,0,0,400*s,224*s,0,0,0,0,noone)
room_set_view(lemon,0,1,0,0,rw,rh,0,0,rw,rh,0,0,0,0,noone)
room_set_view(speciale,0,1,0,0,rw,rh,0,0,rw,rh,0,0,0,0,noone)
