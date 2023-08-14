///lemon_objregister()
//Call once at lemon start, registers a bunch of lists and objects.
//-s- im sorry i dont know how to use lists, maps, or arrays at all lol,,,
lemonobjlist = ds_list_create(); //Object Index
lemonindexlist = ds_list_create(); //Palette Index
lemonoffsetxlist = ds_list_create(); //Grid Offset
lemonoffsetylist = ds_list_create(); //Grid Offset

lemonnamelist = ds_map_create(); //Display Name
lemondesclist = ds_map_create(); //Display Description

lemonargname = ds_map_create(); //Menu Argument Names
lemonargcount = ds_map_create(); //Menu Argument Variables
lemonargdata = ds_map_create(); //Menu Argument Data

        //Object ID //Image Index (for spr_lemonpalette) //Grid Display Offset
listobj(groundblock,0,0,0)
listdesc(groundblock,"Ground", "") //Name, Description

listobj(pipeblock,1,-8,8)
listdesc(pipeblock,"Pipe", "")

listobj(clearpipeblock,12,-8,8)
listdesc(clearpipeblock,"Clear Pipe", "")

listobj(clearpipebend,13,-8,8)
listdesc(clearpipebend,"Clear Pipe Bend", "")

listobj(customobject,14,0,0)
listdesc(customobject,"Custom Object", "")

listobj(grindrail,15,0,-4)
listdesc(grindrail,"Grind Rail", "")

listobj(brick,2,0,0)
listdesc(brick,"Bricks", "")

listobj(goomba,3,0,0)
listdesc(goomba,"Goomba", "")

listobj(hardblock,4,0,0)
listdesc(hardblock,"Hardblock", "")

listobj(bighardblock,5,8,8)
listdesc(bighardblock,"Big Hardblock", "")

listobj(mushroomblock,6,0,8)
listdesc(mushroomblock,"Mushroom Platform", "")

listobj(greenkoopa,3,0,0)
listdesc(greenkoopa,"Green Koopa", "")

listobj(theboll,7,0,0)
listdesc(theboll,"The Boll Team", "")
listargs(theboll,"")

listobj(swingplatform,8,0,0)
listdesc(swingplatform,"Swinging Platform", "")

listobj(slopel,16,0,0)
listdesc(slopel,"Left Slope", "")

listobj(iceblock,17,0,0)
listdesc(iceblock,"Ice Block", "")
