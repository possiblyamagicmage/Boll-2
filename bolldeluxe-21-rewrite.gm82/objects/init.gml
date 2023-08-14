#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//let's initialize da shit
system_prestart()
system_start()
x=-99999
y=-99999
room_goto_next()
global.gamemode="co-op"
charm_import()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
system_step()
//if !instance_exists(charm_playertest)instance_create(player.x,player.y,charm_playertest)
